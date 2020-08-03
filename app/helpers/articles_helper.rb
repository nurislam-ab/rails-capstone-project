module ArticlesHelper
    def most_voted_articles
        featured_article = ''
        if @most_voted_articles.blank?
            @recent_articles.collect do |ra|
                featured_article += <<-HTML
                <article style="background-image: url(#{url_for(ra.image)})", class='featured-article'>
                    <strong class="article-category">
                        #{ra.category.name}
                    </strong>
                    <span class="article-author">
                        #{ra.author.name}
                    </span>
                    <h2 class="article-title">
                        #{link_to ra.title, ra}
                    </h2>
                    <p class="article-preview-text">
                        #{ra.text}
                    </p>
                </article>
                HTML
            end
            featured_article.html_safe
        else
            @most_voted_articles.collect do |mva|
                featured_article += <<-HTML
                <article style="background-image: url(#{url_for(mva.article.image)})", class='featured-article'>
                    <strong class="article-category">
                        #{mva.article.category.name}
                    </strong>
                    <span class="article-author">
                        #{mva.article.author.name}
                    </span>
                    <h2 class="article-title">
                        #{link_to mva.article.title, mva.article}
                    </h2>
                    <p class="article-preview-text">
                        #{mva.article.text}
                    </p>
                </article>
                HTML
            end
            featured_article.html_safe
        end
    end

    def article_preview
        article_preview_card = ''
        @articles.collect do |article|
            article_preview_card += <<-HTML
            <article class='article-preview-card'>
                <div class="article-preview-card-image">
                    #{image_tag(article.image)}
                </div>
                
                <div class="article-preview-card-info">
                    <strong class="article-category">
                        #{article.category.name}
                    </strong>
                    <span class="article-author">
                        #{article.author.name}
                    </span>
                    <h2 class="article-title">
                        #{link_to article.title, article}
                    </h2>
                    <p class="article-preview-text">
                        #{article.text}
                    </p>
                </div>
        </article>
        HTML
        end
        article_preview_card.html_safe
    end

    def article_preview_by_category
        article_preview_card = ''
        @category.articles.collect do |article|
            article_preview_card += <<-HTML
            <article class='article-preview-card'>
                <div class="article-preview-card-image">
                    #{image_tag(article.image)}
                </div>
                
                <div class="article-preview-card-info">
                    <strong class="article-category">
                        #{article.category.name}
                    </strong>
                    <span class="article-author">
                        #{article.author.name}
                    </span>
                    <h2 class="article-title">
                        #{link_to article.title, article}
                    </h2>
                    <p class="article-preview-text">
                        #{article.text}
                    </p>
                </div>
        </article>
        HTML
        end
        article_preview_card.html_safe
    end

    def article_detail_view
        article_preview_card = ''
        
        article_preview_card += <<-HTML
        <article class="article-detailed-view">
            <h2 class="article-title">
                #{@article.title}
            </h2>
            <div class="article-pre-info">
                <div class="article-date-and-category">
                    <strong class="article-category">
                        #{@article.category.name}
                    </strong>
                    <span class="article-published-date">
                        #{@article.created_at.strftime("%B #{@article.created_at.day.ordinalize}, %Y")}
                    </span>
                </div>
                <span class="article-author">
                    #{@article.author.name}
                </span>
            </div>

            <div class="article-image">
                #{image_tag(@article.image)}
            </div>

            <div class="article-content">
                #{@article.text}
            </div>
        </article>
        HTML
        article_preview_card.html_safe
    end
end
