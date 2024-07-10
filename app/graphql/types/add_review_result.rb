module Types
  class AddReviewResult < BaseUnion
    possible_types ReviewType, ValidationErrorType

    def self.resolve_type(object, context)
      if object.success?
        [ReviewType, object.success]
      else
        [ValidationErrorType, object.failure]
      end
    end
  end
end
