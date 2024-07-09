require "rails_helper"

RSpec.describe "GraphQL, updateRepo mutation" do
  let!(:repo) { Repo.create!(name: "Repo Hero", url: "gooogle.com") }

  it "edits an existing repository" do
    query = <<~QUERY
      mutation($id: ID!, $name: String!, $url: String!){
        updateRepo(input: { repoId: $id, name: $name, url: $url }){
          name
          url
        }
      }
    QUERY

    post "/graphql", params: {
      query: query,
      variables: {
        id: repo.id,
        name: "NEW NEW NAME",
        url: repo.url
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to match(
      "updateRepo" => a_hash_including(
        "name" => "NEW NEW NAME",
      )
    )
  end
end
