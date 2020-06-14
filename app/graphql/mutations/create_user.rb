module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthInput, required: false
    end

    argument :auth_provider, AuthProviderSignupData, required: false
    argument :firstname, String, required: true
    argument :lastname, String, required: true
    argument :username, String, required: true

    field :error, String, null: false
    field :user, Types::UserType, null: true

    def resolve(auth_provider: nil, firstname: nil, lastname: nil, username: nil)
      user = User.create(
       password: auth_provider&.[](:credentials)&.[](:password),
       email: auth_provider&.[](:credentials)&.[](:email),
       firstname: firstname,
       lastname: lastname, 
       username: username
      )

      data =  user.errors.present? ? nil : user

      {user: data, error: user.errors.full_messages.join(", ")}
    end
  end
end