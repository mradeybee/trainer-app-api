require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_presence_of(:username) }
  end

  describe 'custom email validation' do
    subject { User.new(email: 'test@email.com', password: 'paSSw0Rd', firstname: 'firstname', lastname: 'lastname', username: 'username') }

    context 'valid email' do
      it { is_expected.to be_valid }
    end

    context 'invalid email' do
      before do
        subject.email = 'email.com'
        subject.valid?
      end

      it { is_expected.to be_invalid }

      it 'returns an error when email is invalid' do
        expect(subject.errors[:email]).to match_array('is invalid')
      end
    end
  end
    
  context 'sets tos agreed time' do
    subject { Fabricate(:user) }

    it 'sets tos agreed time' do
      expect(subject.set_tos_agreed_time).to_not be nil
    end
  end

   context 'generate refresh token' do
    subject { Fabricate(:user) }

    it 'generates refresh token' do
      expect(subject.refresh_token).to_not be nil
    end
  end
end
