# this new unio type will return either a RepoType or a NotFoundType when whe resolve this type
# we'll check to see if the object is a Repo instance If it is then we will return the RepoType
# if not then we return the NotFoundType

module Types
  class RepoResultType < Types::BaseUnion
    possible_types RepoType, NotFoundType

    def self.resolve_type(object, context)
      if object.is_a?(Repo)
        RepoType
      else
        NotFoundType
      end
    end
  end
end
