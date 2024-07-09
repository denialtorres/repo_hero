require "rails_helper"

RSpec.describe "Graphql, addRepo mutation" do

  it "adds a new repository" do
  query = <<~QUERY
            mutation($name: String!, $url: String!){
              addRepo(input: { name: $name, url: $url }){
                id
                name
                url
              }
            }
          QUERY

    post "/graphql", params: {
      query: query,
      variables: {
        name: "RepoHero",
        url: "www.google.com"
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "addRepo" => {
        "name" => "RepoHero",
        "id" => Repo.first.id.to_s,
        "url" => "www.google.com"
      }
    )
  end
end
