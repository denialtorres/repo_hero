require "rails_helper"

RSpec.describe "GraphQL, addRepositoryCategory mutation" do
  let!(:repo) { Repo.create!(name: "Repo Hero", url: "google.com") }
  let!(:category) { Category.create!(name: "Ruby") }

  it "joins an existing category to a repository" do
    query = <<~QUERY
      mutation($repo_id: ID!, $category_id: ID!){
        addRepositoryCategory(input: { repoId: $repo_id, categoryId: $category_id}){
          id
          categories {
            name
          }
        }
      }
    QUERY

    post "/graphql", params: {
      query: query,
      variables: {
        repo_id: repo.id,
        category_id: category.id
      }
    }
    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "addRepositoryCategory" => {
        "id" => repo.id.to_s,
        "categories" => [{"name" => category.name}]
      }
    )
  end
end
