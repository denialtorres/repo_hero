module Types
  class LoginResult < BaseUnion
    possible_types AuthenticatedUserType, FailedLoginType

    def self.resolve_type(object, context)
      if object.success?
        [AuthenticatedUserType, object.success]
      else
        Types::FailedLoginType
      end
    end
  end
end
