module Types
  class FailedLoginType < BaseObject
    field :error, String, null: false

    def error
      "Invalid email of password"
    end
  end
end
