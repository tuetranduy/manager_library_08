class User < ApplicationRecord
  before_save :downcase_email

  attr_accessor :remember_token

  has_many :borrows, dependent: :destroy
  has_many :books, through: :borrows
  has_many :likes, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :user_active_relationships, class_name: UserFollowRelationship.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :user_passive_relationships, class_name: UserFollowRelationship.name,
   foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :user_passive_relationships, source: :follower
  has_many :following, through: :user_active_relationships, source: :followed
  has_many :book_active_relationships, class_name: BookFollowerRelationship.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :follower_books, through: :book_active_relationships
  has_many :author_active_relationships, class_name: AuthorFollowRelationship.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :follower_authors, through: :author_active_relationships
  has_many :comments, dependent: :destroy

  scope :order_user, ->{order(name: :asc)}

  validates :name,  presence: true, length: {maximum: Settings.user.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
   format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.min_pass}

  has_secure_password

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def user_follow other_user
    following << other_user
  end

  def user_unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
