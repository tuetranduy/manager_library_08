class User < ApplicationRecord
  before_save :downcase_email

  has_many :borrows, dependent: :destroy
  has_many :books, through: :borrows
  has_many :likes, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :user_active_relationships, class_name: UserFollowRelationShip.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :user_passive_relationships, class_name: UserFollowRelationShip.name,
   foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :user_active_relationships
  has_many :following, through: :user_passive_relationships, source: :followed
  has_many :book_active_relationships, class_name: BookFollowerRelationship.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :follower_books, through: :book_active_relationships
  has_many :author_active_relationships, class_name: AuthorFollowRelationship.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :follower_authors, through: :author_active_relationships
  has_many :comments, dependent: :destroy

  validates :name,  presence: true, length: {maximum: Settings.user.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
   format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.min_pass}

  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
