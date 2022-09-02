class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :receipient_email
      t.text :receipient_address
      t.string :receipient_contact_number
      t.date :expected_delivery_date
      t.text :comments
      t.string :invoice_number
      t.float :total_charge
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
