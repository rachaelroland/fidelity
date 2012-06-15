class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.string :attribute
      t.integer :product_id

      t.timestamps
    end
  end
end
