require 'rails_helper'

RSpec.describe Confirmation, type: :model do
describe 'Validations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'sets token' do
    subject { Fabricate(:confirmation) }

    it 'sets tos token' do
      expect(subject.token).to_not be nil
    end
  end

   context 'generate refresh token' do
    subject { Fabricate(:confirmation) }

    it 'sets confirmed_at' do
      subject.completed!
      expect(subject.confirmed_at).to_not be nil
    end
  end
end
