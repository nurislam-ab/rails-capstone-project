require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'should create articles' do
    it 'records cannot be blank ' do
      expect { Article.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'test associations' do
    it 'should have one user' do
      article = Article.reflect_on_association(:author)
      expect(article.macro).to eq(:belongs_to)
    end

    it 'should have one category' do
      article = Article.reflect_on_association(:category)
      expect(article.macro).to eq(:belongs_to)
    end

    it 'should have many votes' do
      article = Article.reflect_on_association(:votes)
      expect(article.macro).to eq(:has_many)
    end
  end
end
