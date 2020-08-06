# CategoryHelper
module CategoriesHelper
  def show_categories(categories)
    category_preview = ''
    categories.collect do |c|
      next unless c.articles.count.positive?

      category_preview += <<-HTML
                    <article class='featured-article featured-article-category'>
                        <div class="article-image-holder" style="background-image: url(#{url_for(c.latest_article.first.image)})"></div>
                        <strong class="article-category">
                            #{c.name}
                        </strong>
                        <h2 class="article-title">
                            #{link_to c.latest_article.first.title, c.latest_article.first}
                        </h2>
                        #{votes_btn(c.latest_article.first)}
                    </article>
      HTML
    end
    category_preview.html_safe
  end

  def category_blocks(categories)
    html_block = ''
    categories.collect do |c|
      html_block += <<-HTML
      <div class="category-box">
        #{link_to(c.name, c)}
      </div>
      HTML
    end

    html_block.html_safe
  end
end
