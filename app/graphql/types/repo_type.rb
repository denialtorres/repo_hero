module Types
  class RepoType < Types::BaseObject
    field :name, String, null: false
    field :url, String, null: false
    field :name_reversed, String, null: false, complexity: 10
    field :categories, [CategoryType], null: false
    field :reviews, ReviewType.connection_type, null: false, default_page_size: 10, max_page_size: 20

    def name_reversed
      object.name.reverse
    end
  end
end
