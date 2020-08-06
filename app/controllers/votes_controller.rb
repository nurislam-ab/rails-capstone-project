# Class documentation comment
class VotesController < ApplicationController
  before_action :require_login
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_back(fallback_location: root_path, notice: 'You voted for a article.')
    else
      redirect_back(fallback_location: root_path, alert: 'You cannot vote for this article.')
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to articles_path, notice: 'You have undo a vote for a article.'
    else
      redirect_to articles_path, alert: 'You cannot undo vote for a article that you did not vote before.'
    end
  end
end
