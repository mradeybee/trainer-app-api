module Types
  class AuthInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'AUTH_INPUT_CREDENTIALS'

    argument :email, String, required: true
    argument :password, String, required: true
  end
end