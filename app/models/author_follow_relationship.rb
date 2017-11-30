class AuthorFollowRelationship < ApplicationRecord
  belongs_to :author
  belongs_to :follower_author, class_name: User.name
end
