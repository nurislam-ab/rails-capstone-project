# Class documentation comment
class User < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'only allows letters' }
  validates :email, presence: true, uniqueness: true

  has_many :articles, inverse_of: 'author', foreign_key: 'author_id'
  has_many :votes, dependent: :destroy

  has_one_attached :avatar

  after_initialize :default_values, unless: :persisted?

  def user_image_path
    avatar.attached? ? avatar : 'default-user.jpg'
  end

  def default_values
    self.website ||= 'https://www.kitchenloop.com'
  end
end
