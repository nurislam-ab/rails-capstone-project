# frozen_string_literal: true

# Class documentation comment

json.extract! category, :id, :created_at, :updated_at
json.url category_url(category, format: :json)
