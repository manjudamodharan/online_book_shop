class CreateOrderBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :order_books do |t|
      t.integer :book_id
      t.integer :order_id
      t.integer :no_of_copies

      t.timestamps
    end
  end
end
