require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'create categories' do
    it 'records cannot be blank ' do
      expect { Category.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'create article on a category' do
    let(:category) { Category.create(name: 'Recipes', priority: 1) }
    let(:article) { category.articles.create(title: 'New recipe', text: 'content', author_id: 2) }
    it 'user author is Calvin' do
      expect(category.articles).to include(article)
    end
  end

  context 'test associations' do
    it 'should have many articles' do
      category = Category.reflect_on_association(:articles)
      expect(category.macro).to eq(:has_many)
    end
  end
end
