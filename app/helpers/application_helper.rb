module ApplicationHelper
    def votes_btn(article)
        vote = Vote.find_by(article: article, user: current_user)
        if vote
          link_to('Undo vote', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: "fa fa-heart", alt: 'Undo vote', title: 'Undo vote')
        else
          link_to('Vote', article_votes_path(article_id: article.id), method: :article, class: "fa fa-heart-o", alt: 'Vote', title: 'Vote')
        end
    end
end
