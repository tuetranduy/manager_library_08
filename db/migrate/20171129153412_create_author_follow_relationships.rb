class CreateAuthorFollowRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :author_follow_relationships do |t|
      t.integer :follower_id
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
