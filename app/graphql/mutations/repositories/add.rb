module Mutations
  module Repositories
    class Add < BaseMutation
      graphql_name "AddRepo"

      type Types::RepoType, null: false

      argument :name, String, required: true
      argument :url, String,  required: true

      def resolve(name: , url: )
        Repo.create!(
          name: name,
          url: url
        )
      end
    end
  end
end
