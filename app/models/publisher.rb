class Publisher < ApplicationRecord
  has_many :book, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :order_name, ->{order(name: :asc)}
  scope :search_by_name, ->(search){where("name LIKE ?", "%#{search}%") if search.present?}
end
