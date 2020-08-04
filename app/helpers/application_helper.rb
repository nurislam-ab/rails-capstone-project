# frozen_string_literal: true

module ApplicationHelper
  def votes_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'undo-vote-icon vote-icon', alt: 'Undo vote', title: 'Undo vote')
    else
      link_to('', article_votes_path(article_id: article.id), method: :article, class: 'vote-icon', alt: 'Vote', title: 'Vote')
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

  def article_edit_btns(article)
    article_edit_html = ''
    if current_user == article.author
      article_edit_html += <<-HTML
        #{link_to 'Edit', edit_article_path(article), class: 'edit-btn'}
        #{link_to 'Destroy', article, method: :delete, class: 'delete-btn', data: { confirm: 'Are you sure?' }}
      HTML
    end
    article_edit_html.html_safe
  end

  def set_page_title(title)
    content_for :page_title, title
  end
end
