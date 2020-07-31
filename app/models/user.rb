class User < ApplicationRecord
    has_many :articles, inverse_of: 'author', foreign_key: 'author_id'
    has_many :votes, dependent: :destroy
    
end
