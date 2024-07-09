module Mutations
  module Repositories
    class AddCategory < BaseMutation
      graphql_name "addRepositoryCategory"

      type Types::RepoType, null: false

      argument :repo_id, ID, required: true
      argument :category_id, ID, required: true

      def resolve(repo_id:, category_id:)
        Repo.find(repo_id).tap do |repo|
          repo.categories << Category.find(category_id)
        end
      end
    end
  end
end
