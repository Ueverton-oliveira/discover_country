# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :country, Types::CountryType, null: true do
      description "Find a country by ID"
      argument :id, ID, required: true
    end

    def country(id:)
      Country.find(id)
    end

    field :countries, [Types::CountryType], null: true do
      description "List all countries"
    end
    field :user, Types::UserType, null: true do
      description "Find a user by ID"
      argument :id, ID, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end

    field :users, [Types::UserType], null: false do
      description "List all users"
    end

    def users
      User.all
    end

    def countries
      Country.all
    end
  end
end
