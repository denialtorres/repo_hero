require "rails_helper"

RSpec.describe "GraphQL, addReview mutation" do
  let!(:repo) { Repo.create!(name: "Repo Hero", url: "https://github.com/repohero/repohero") }
  let(:query) do
    <<~QUERY
      mutation($id: ID!, $rating: String!, $comment: String!){
        addReview(input: { repoId: $id, rating: $rating, comment: $comment })
        {
          id
          rating
        }
      }
    QUERY
  end

  it "Adds a new review" do
    post "/graphql", params: {
      query: query,
      variables: {
        id: repo.id,
        rating: 5.to_s,
        comment: "Nice repo"
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "addReview" => {
        "id" => Review.last.id.to_s,
        "rating" => 5,
      }
    )
  end
end
