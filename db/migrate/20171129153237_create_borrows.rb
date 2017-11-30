class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :borrow_start
      t.datetime :borrow_end
      t.boolean :is_accept

      t.timestamps
    end
  end
end
