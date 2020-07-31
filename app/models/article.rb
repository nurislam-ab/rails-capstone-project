class Article < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'

    belongs_to :category
    has_many :votes, dependent: :destroy
    
    has_one_attached :image
end
