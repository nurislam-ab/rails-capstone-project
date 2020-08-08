require_relative '../rails_helper'

RSpec.describe VotesController, type: :controller do
  let(:user) { User.create(name: 'Calvin') }
  let(:article) { Article.create(title: 'New Title', text: 'content', author_id: user.id) }

  describe '#vote' do
    it 'adds a vote to votes' do
      session[:user_id] = user.id
      expect { put :create, params: { user_id: user, article_id: article } }
    end
  end
end
