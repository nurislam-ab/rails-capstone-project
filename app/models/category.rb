# Class documentation comment
class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 2..200 }, uniqueness: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'only allows letters' }
  validates :priority, presence: true, numericality: { only_integer: true }
  after_initialize :default_values, unless: :persisted?

  has_many :articles

  scope :categories_by_priority, -> { order('priority DESC') }

  def latest_article
    articles.order(created_at: :desc)
  end

  def default_values
    self.priority ||= 1
  end
end
