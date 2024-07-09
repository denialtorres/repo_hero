module Mutations
  module Repositories
    class Delete < BaseMutation
      graphql_name "DeleteRepo"

      type Types::RepoType

      argument :repo_id, ID, required: true

      def resolve(repo_id: )
        Repo.find(repo_id).destroy
      end
    end
  end
end
