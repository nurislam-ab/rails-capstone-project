# frozen_string_literal: true

# Class documentation comment

json.extract! article, :id, :created_at, :updated_at
json.url article_url(article, format: :json)
