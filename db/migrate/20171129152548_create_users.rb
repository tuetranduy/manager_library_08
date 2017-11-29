class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :is_admin
      t.string :password_digest
      t.string :remember_digest
      t.boolean :is_activated
      t.string :activation_digest
      t.string :avatar_img

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :is_admin
    add_index :users, :email, unique: true
  end
end
