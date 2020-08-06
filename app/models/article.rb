# Class documentation comment
class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 5..200 }, uniqueness: true
  validates :preview_text, presence: true, length: { in: 5..200 }
  validates :text, presence: true
  validates :image, presence: true
  validates :category, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  belongs_to :category
  has_many :votes, dependent: :destroy

  has_one_attached :image
  has_rich_text :text

  scope :recent_articles, -> { order('created_at desc').limit(5) }

  def article_image_path
    image.attached? ? image : 'placeholder-image.png'
  end

  def category_not_nil
    errors.add :category_id, 'cannot be nil' if category_id.nil?
  end
end
