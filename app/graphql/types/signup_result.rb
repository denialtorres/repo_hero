module Types
  class SignupResult < BaseUnion
    possible_types AuthenticatedUserType, ValidationErrorType

    def self.resolve_type(object, _context)
      if object.success?
        [AuthenticatedUserType, object.success]
      else
        [ValidationErrorType, object.failure]
      end
    end
  end
end
