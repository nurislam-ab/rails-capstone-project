# UsersHelper
module UsersHelper
  def avatar_attached(field, avatar)
    html_block = ''
    html_block += if @user.avatar.attached?
                    <<-HTML
                #{field.file_field avatar}
                    HTML
                  else
                    <<-HTML
            #{field.file_field avatar, required: true}
                    HTML
                  end

    html_block.html_safe
  end

  def user_articles(user, name, articles)
    if articles.count.zero?
      content_tag :div, class: 'no-items' do
        if current_user == user
          concat content_tag(:p, "#{name}, you don't have any articles yet")
          concat content_tag(:p, 'Would you like to add a new article?')
          concat link_to('Add a new article', new_article_path, class: 'add-btn')
        else
          content_tag(:p, "#{name} don't have any articles yet")
        end
      end
    else
      article_preview(articles)
    end
  end
end
