module Types
  class CountryType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :name, String, null: false
    field :capital, String, null: true
    field :population, Int, null: true
    field :area, Float, null: true
  end
end
