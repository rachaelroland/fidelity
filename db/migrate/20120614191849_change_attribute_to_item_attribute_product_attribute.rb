class ChangeAttributeToItemAttributeProductAttribute < ActiveRecord::Migration
  def up
    rename_column :questions, :attribute, :item_attribute
    rename_column :product_attributes, :attribute, :item_attribute
  end

  def down
  end
end
