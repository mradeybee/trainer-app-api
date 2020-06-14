module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :firstname, String, null: false
    field :lastname, String, null: false
    field :username, String, null: false
    field :tos_agreed_at, String, null: false
    field :refresh_token, String, null: true
  end
end
