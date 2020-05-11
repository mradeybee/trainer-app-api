require 'rails_helper'

RSpec.describe "Email Confirmation", type: :request do
  let(:confirmation) { Fabricate(:confirmation) }

  describe "PATCH /update" do
    describe "Invalid token" do
      it "returns error message" do
        patch "/email_confirmation/invlaid-token"
        expect(response.status).to eql 422
        expect(JSON.parse(response.body)['error']).to include('Invalid confirmation token, please contact admin.')
      end
    end

    describe "Valid token" do
      it "returns success message" do
        patch "/email_confirmation/#{confirmation.token}"
        expect(response.status).to eql 200
        expect(JSON.parse(response.body)['message']).to include('Email confirmed!')
        confirmation.reload
        expect(confirmation.completed?).to be true
        expect(confirmation.confirmed_at.present?).to be true
      end
    end

    describe "Already confirmed email" do
      it "returns error message" do
        confirmation.completed!
        patch "/email_confirmation/#{confirmation.token}"
        expect(JSON.parse(response.body)['error']).to include('Invalid confirmation token, please contact admin.')
        expect(confirmation.completed?).to be true
        expect(confirmation.confirmed_at.present?).to be true
      end
    end
  end
end
