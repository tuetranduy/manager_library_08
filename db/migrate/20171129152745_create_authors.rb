class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.datetime :birthday
      t.text :details

      t.timestamps
    end
    add_index :authors, :name, unique: true
  end
end
