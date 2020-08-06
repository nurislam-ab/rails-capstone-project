require 'rails_helper'

RSpec.describe User, type: :model do
  context 'registering user' do
    it 'name cannot be blank' do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'email cannot be blank' do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it do
      create(:user)
      should validate_uniqueness_of(:email).ignoring_case_sensitivity
    end

    it 'should register user successfuly' do
      user = User.new(name: 'test user', email: 'mail@mail.com').save
      expect(user).to be true
    end
  end
end
