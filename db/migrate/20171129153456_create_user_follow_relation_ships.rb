class CreateUserFollowRelationShips < ActiveRecord::Migration[5.1]
  def change
    create_table :user_follow_relation_ships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
