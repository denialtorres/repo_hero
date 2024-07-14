module Mutations
  module Reviews
    class Add < BaseMutation
      include Dry::Monads[:result]

      graphql_name "AddReview"

      type Types::AddReviewResult, null: false

      argument :repo_id, ID, required: true
      argument :rating, Types::ReviewRating, required: true
      argument :comment, String, required: true

      def resolve(repo_id:, rating:, comment:)
        review = Review.new(
          repo_id: repo_id,
          rating: rating,
          comment: comment
        )

        review.user = context[:current_user]

        if review.save
          Success(review)
        else
          Failure(review)
        end
      end
    end
  end
end
