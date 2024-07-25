# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, Types::UserType, null: true do
      description "Create a new user"
      argument :input, Types::UserInputType, required: true
    end

    def create_user(input:)
      User.create(email: input[:email], password: input[:password])
    end
  end
end
