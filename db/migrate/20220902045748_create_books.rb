class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.float :price
      t.string :author
      t.date :year
      t.integer :available_copies
      t.boolean :is_deleted, default: 0

      t.timestamps
    end
  end
end
