class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  scope :sort_by_alphabet, ->{order(name: :asc)}
end
