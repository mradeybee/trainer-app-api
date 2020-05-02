require 'rails_helper'

RSpec.describe "Users", type: :request do
  valid_user_params = {
    firstname: "firstname",
    lastname: "lastname",
    username: "username",
    password: "password",
    email: "user1@email.com"
  }

  invalid_email_user_params = {
    firstname: "firstname",
    lastname: "lastname",
    username: "username",
    password: "password",
    email: "user1email.com"
  }

  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

 describe 'create (POST /users)' do
    context 'with valid cridentials' do
      it 'creates user record' do
        post '/users', params: valid_user_params
        # binding.pry
        expect(response.status).to eql 201
        expect(JSON.parse(response.body).keys).to include('jwt')
      end
    end

    context 'with invalid cridentials' do
      context 'invalid email' do
        it 'return an error if email is incorrect' do
          post '/users', params:  invalid_email_user_params
  
          expect(response.status).to eql 422
          expect(JSON.parse(response.body)['errors']).to include('Email is invalid')
        end

        it 'return an error if email is blank' do
          post '/users', params:  {auth: {password: 'paSSw0Rd!', email: ''}}
  
          expect(response.status).to eql 422
          expect(JSON.parse(response.body)['errors']).to include("Email can't be blank")
        end
      end
      
      context 'empty password' do
        it 'return an error if password is blank' do
          post '/users', params:  {auth: {password: '', email: 'james@email.com'}}
  
          expect(response.status).to eql 422
          expect(JSON.parse(response.body)['errors']).to include("Password can't be blank")
        end
      end
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

end
