require "rails_helper"

RSpec.describe "GraphQL, deleteRepo mutation" do
  let!(:repo) { Repo.create!(name: "Repo Hero", url: "google.com") }

  it "deletes an existing repo" do
    query = <<~QUERY
      mutation($id: ID!){
        deleteRepo(input: { repoId: $id }){
          id
        }
      }
    QUERY

    post "/graphql", params: {
      query: query,
      variables: {
        id: repo.id
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "deleteRepo" => {
        "id" => repo.id.to_s
      }
    )
  end
end
