class CreateUserFollowRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :user_follow_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :user_follow_relationships, :follower_id
    add_index :user_follow_relationships, :followed_id
    add_index :user_follow_relationships, [:follower_id, :followed_id], unique: true
  end
end
