# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_review, mutation: Mutations::Reviews::Add
    field :update_review, mutation: Mutations::Reviews::Update
    field :delete_review, mutation: Mutations::Reviews::Delete

    # for categories
    field :add_category, mutation: Mutations::Categories::Add

    # for repositories
    field :add_repo, mutation: Mutations::Repositories::Add
    field :update_repo, mutation: Mutations::Repositories::Update
    field :delete_repo, mutation: Mutations::Repositories::Delete
  end
end
