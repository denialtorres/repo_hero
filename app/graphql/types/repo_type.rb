module Types
  class RepoType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :url, String, null: false
    field :name_reversed, String, null: false, complexity: 10
    field :categories, [CategoryType], null: false
    field :reviews, ReviewType.connection_type, null: false, default_page_size: 10, max_page_size: 20
    # To find the relevant activities for a repo, this GraphQL field will use the
    # Repo#activities method defined by the has_many association on the Repo model.
    field :activities, ActivityType.connection_type, null: false, default_page_size: 10, max_page_size: 20, complexity: 10

    def name_reversed
      object.name.reverse
    end
  end
end
