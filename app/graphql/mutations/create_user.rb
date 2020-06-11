module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthInput, required: false
    end

    argument :auth_provider, AuthProviderSignupData, required: false
    argument :firstname, String, required: true
    argument :lastname, String, required: true
    argument :username, String, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(auth_provider: nil, firstname: nil, lastname: nil, username: nil)
      User.create!(
       password: auth_provider&.[](:credentials)&.[](:password),
       email: auth_provider&.[](:credentials)&.[](:email),
       firstname: firstname,
       lastname: lastname, 
       username: username
      )
    end
  end
end