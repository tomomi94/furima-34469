class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.integer :category_id
      t.integer :product_condition_id
      t.integer :price
      t.integer :estimated_shipping_id
      t.integer :shipping_area_id
      t.integer :shipping_fee_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end