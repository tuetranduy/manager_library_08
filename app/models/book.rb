class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher
  belongs_to :author
  validates :name, presence: true
  scope :sort_by_alphabet, ->{order(name: :asc)}
end
