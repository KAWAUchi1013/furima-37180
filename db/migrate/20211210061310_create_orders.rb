class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code, null:false
      t.string :municipalities, null:false
      t.string :address, null:false
      t.string :building_name
      t.string :telephone_number, null:false
      t.references :buyer, null:false,foreign_key: true
      t.integer :shipping_area_id, null:false
      t.timestamps
    end
  end
end