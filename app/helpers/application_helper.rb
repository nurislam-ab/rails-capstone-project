module ApplicationHelper
  def votes_btn(article)
      vote = Vote.find_by(article: article, user: current_user)
      if vote
        link_to('', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: "undo-vote-icon vote-icon", alt: 'Undo vote', title: 'Undo vote')
      else
        link_to('', article_votes_path(article_id: article.id), method: :article, class: "vote-icon", alt: 'Vote', title: 'Vote')
      end
  end

  def menu_categories
    cat_menu_list = ''
    categories = Category.all
    categories.collect do |c|
      cat_menu_list += <<-HTML
        <li>
          #{link_to(c.name, category_path(c))}
        </li>  
      HTML
    end
    cat_menu_list.html_safe
  end

  def most_voted_articles
    
  end
end
