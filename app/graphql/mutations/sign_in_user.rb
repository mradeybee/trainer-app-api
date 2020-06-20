module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthInput, required: false

    field :error, String, null: true
    field :jwt, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      user = User.find_by email: credentials[:email]

      if user.present? && user.authenticate(credentials[:password])
        jwt = generate_access_token(user.id)
        { user: user, jwt: jwt }
      else
        {error: 'Invalid Credentials'}
      end
    end

    def generate_access_token(user_id)
      TokenGenerator.generate_token({user: user_id})
    end
  end
end