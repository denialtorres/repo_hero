module Types
  class ValidationErrorType < BaseObject

    class AttributeError < BaseObject
      field :attribute, String, null: false
      field :errors, [String], null: false

      def errors
        object[:errors].map(&:message)
      end
    end

    class Errors < BaseObject
      field :full_messages, [String], null: false
      field :attribute_errors, [AttributeError], null: false

      def attribute_errors
        object.group_by_attribute.map do |attribute, errors|
          {
            attribute: attribute,
            errors: errors
          }
        end
      end
    end

    field :errors, Errors, null: false
  end
end
