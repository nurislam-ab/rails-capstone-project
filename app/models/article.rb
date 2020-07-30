class Article < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    
    has_one :article_category
    has_one :category, through: :article_category, dependent: :destroy
end
