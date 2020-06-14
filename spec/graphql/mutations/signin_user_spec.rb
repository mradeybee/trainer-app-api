require 'rails_helper'

RSpec.describe 'Mutations::SignInUserTest' do
 let!(:user) { Fabricate(:user, password: 'passpass',  firstname: "John", lastname: "Doe", username: "JDoe", 	email: "jdoe@email.com") }

  def perform(**args)
    Mutations::SignInUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  describe "when user is valid" do
    it 'signs in a user' do
      user = perform(
        credentials: {
          password: "passpass",
          email: "jdoe@email.com"
        }
      )

      expect(user[:jwt].present?).to be true
    end
  end

  describe "when user is invalid" do
    it 'returns error' do
      user = perform(
        credentials: {
          password: "passpass",
          email: "unknown@email.com"
        }
      )

      expect(user[:error]).to eql 'Invalid Credentials'
    end
  end
end