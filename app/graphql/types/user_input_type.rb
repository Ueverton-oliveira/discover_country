module Types
  class UserInputType < Types::BaseInputObject
    description "Attributes for creating a user"
    argument :email, String, required: true
    argument :password, String, required: true
    # Add more fields as needed (e.g., name, role, etc.)
  end
end
