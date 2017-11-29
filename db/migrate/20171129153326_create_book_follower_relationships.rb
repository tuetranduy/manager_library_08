class CreateBookFollowerRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :book_follower_relationships do |t|
      t.integer :follower_id
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
