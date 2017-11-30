class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.references :publisher, foreign_key: true
      t.references :author, foreign_key: true
      t.text :details
      t.integer :rating

      t.timestamps
    end
    add_index :books, :name, unique: true
  end
end
