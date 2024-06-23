module Types
  class RepoType < Types::BaseObject
    field :name, String, null: false
    field :url, String, null: false
    field :name_reversed, String, null: false, complexity: 10
    field :categories, [CategoryType], null: false

    def name_reversed
      object.name.reverse
    end
  end
end
