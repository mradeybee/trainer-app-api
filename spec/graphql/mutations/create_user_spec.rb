require 'rails_helper'

RSpec.describe 'Mutations::CreateUserTest' do
  def perform(**args)
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  it 'create a new user' do
    user = perform(
    firstname: "John",
    lastname: "Doe",
    username: "JDoe",
    auth_provider: {
      credentials: {
      	email: "jdoe@email.com",
        password: "passpass",
      }
    }
    )

    expect(user[:user].present?).to be true
  end
end