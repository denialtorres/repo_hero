require "rails_helper"

RSpec.describe "GraphQL, deleteReview mutation" do
  let!(:repo) { Repo.create!(name: "Repo Hero", url: "google.com") }
  let!(:user) do
    User.create!(
      email: "test@example",
      password: "SecurePassword1",
      name: "Test User",
    )
  end
  let!(:review) do
    repo.reviews.create!(
      comment: "Spammy spam spam spam",
      rating: 1,
      user: user
    )
  end


  it "deletes an existing review" do
    query = <<~QUERY
      mutation($id: ID!){
        deleteReview(input: { reviewId: $id }){
          id
        }
      }
    QUERY

    post "/graphql", params: {
      query: query,
      variables: {
        id: review.id
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "deleteReview" => {
        "id" => review.id.to_s
      }
    )
  end
end
