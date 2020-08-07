# ArticlesHelper
module ArticlesHelper
  def most_voted_articles
    featured_article = ''
    if @most_voted_articles.blank?
      @recent_articles.collect do |ra|
        featured_article += <<-HTML
          <article class='featured-article'>
              <div class="article-image-holder" style="background-image: url(#{url_for(ra.image)})"></div>
              <strong class="article-category">#{ra.category.name}</strong>
              <span class="article-author">#{ra.author.name}</span>
              <h2 class="article-title">#{link_to ra.title, ra}</h2>
              <p class="article-preview-text">#{ra.preview_text}</p>
          </article>
        HTML
      end
    else
      @most_voted_articles.collect do |mva|
        featured_article += <<-HTML
          <article class='featured-article'>
              <div class="article-image-holder" style="background-image: url(#{url_for(mva.article.image)})"></div>
              <strong class="article-category">#{mva.article.category.name}</strong>
              <span class="article-author">#{mva.article.author.name}</span>
              <h2 class="article-title">#{link_to mva.article.title, mva.article}</h2>
              <p class="article-preview-text">#{mva.article.preview_text}</p>
          </article>
        HTML
      end
    end
    featured_article.html_safe
  end

  def article_preview(articles)
    article_preview_card = ''
    if articles.count.positive?
      articles.collect do |article|
        article_preview_card += <<-HTML
          <article class='article-preview-card'>
              <div class="article-preview-card-image">#{image_tag(article.image)}</div>
              <div class="article-preview-card-info">
                  <div class="pci-blocks-wraper">
                      <div class="apc-header">
                          #{link_to article.category.name, article.category, class: 'article-category'}
                          #{link_to article.author.name, article.author, class: 'article-author'}
                      </div>
                      <h2 class="article-title">#{link_to article.title, article}</h2>
                      <p class="article-preview-text">#{article.preview_text}</p>

                      <div class="apc-header">
                          #{link_to 'Read more', article, class: 'article-read-more'}
                          <div class="article-votes">#{votes_btn(article)}</div>
                      </div>
                  </div>
              </div>
          </article>
        HTML
      end
      article_preview_card.html_safe
    else
      content_tag :div, class: 'no-items' do
        content_tag(:p, 'No articles in this category yet')
      end
    end
  end

  def article_detail_view
    article_detail_view = ''
    article_detail_view += <<-HTML
        <article class="article-detailed-view">
            <div class="article-pre-info">
                <div class="article-date-and-category">
                    #{link_to @article.category.name, @article.category, class: 'article-category'}
                </div>
                <div class="article-votes">
                    #{votes_btn(@article)}
                    <span class="article-votes-count">#{pluralize(@article.votes.count, 'vote')}</span>
                </div>
            </div>
            <h2 class="article-title">#{@article.title}</h2>

            <div class="article-pre-info">
                <div class="article-date-and-category">
                    <span class="article-published-date">#{@article.created_at.strftime("%B #{@article.created_at.day.ordinalize}, %Y")}</span>
                </div>

                #{link_to @article.author.name, @article.author, class: 'article-author'}
            </div>

            <div class="article-preivew-text">
                <p>#{@article.preview_text}</p>
            </div>
            <div class="article-image">#{image_tag(@article.image)}</div>
            <div class="article-content">#{@article.text}</div>
        </article>
    HTML
    article_detail_view.html_safe
  end

  def image_field_check(model, field)
    if model.new_record?
      field.file_field(:image, required: true)
    else
      field.file_field(:image) + image_tag(field.object.image)
    end
  end
end
