class BookFollowerRelationship < ApplicationRecord
  belongs_to :book
  belongs_to :follower_book, class_name: User.name
end
