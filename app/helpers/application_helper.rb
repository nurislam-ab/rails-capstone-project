# ApplicationHelper
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
    categories = Category.all.order('created_at desc').limit(5)
    categories.collect do |c|
      cat_menu_list += <<-HTML
        #{menu_link_to(c.name, category_path(c))}
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

  def page_title(title)
    content_for :page_title, title
  end

  def user_profile_edit_btn(user)
    return link_to('Edit', edit_user_path(user)) unless current_user != user
  end

  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li) do
      link_to link_text, link_path, class: class_name
    end
  end

  def show_errors(model)
    if model.errors.any?
      content_tag :div, class: 'error-explanation' do
        concat content_tag(:h2, pluralize(model.errors.count, 'error'))
        model.errors.full_messages.each do |message|
          concat content_tag(:li, message)
        end
      end
    end
  end
end
