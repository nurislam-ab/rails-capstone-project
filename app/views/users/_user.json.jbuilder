# frozen_string_literal: true

# Class documentation comment

json.extract! user, :id, :created_at, :updated_at
json.url user_url(user, format: :json)
