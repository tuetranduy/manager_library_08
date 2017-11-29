class User < ApplicationRecord
  has_many :borrows, dependent: :destroy
  has_many :books, through: :borrows
  has_many :likes, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :user_active_relationships, class_name: UserFollowRelationships.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :user_passive_relationships, class_name: UserFollowRelationships.name,
   foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :user_active_relationships
  has_many :following, through: :user_passive_relationships, source: :followed
  has_many :book_active_relationships, class_name: BookFollowerRelationships.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :follower_books, through: :book_active_relationships
  has_many :author_active_relationships, class_name: AuthorFollowRelationships.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :follower_authors, through: :author_active_relationships
  has_many :comments, dependent: :destroy
end
