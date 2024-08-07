module Mutations
  module Reviews
    class Delete < BaseMutation
      graphql_name "DeleteReview"

      type Types::ReviewType

      argument :review_id, ID, required: true

      def resolve(review_id: )
        Review.find(review_id).destroy
      end
    end
  end
end
