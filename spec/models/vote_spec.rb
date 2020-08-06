require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'test associations' do
    it 'should have one user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eq(:belongs_to)
    end

    it 'should have one article' do
      vote = Vote.reflect_on_association(:article)
      expect(vote.macro).to eq(:belongs_to)
    end
  end
end
