module Mutations
  module Repositories
    class Update < BaseMutation
      graphql_name "updateRepo"

      type Types::RepoType, null: false

      argument :repo_id, ID, required: true
      argument :name, String, required: true
      argument :url, String,  required: true

      def resolve(repo_id:, name: , url: )
        Repo.find(repo_id).tap do |repo|
          repo.update!(
            name: name,
            url: url
          )
        end
      end
    end
  end
end
