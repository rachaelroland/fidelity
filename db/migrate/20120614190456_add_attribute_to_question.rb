class AddAttributeToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :attribute, :string
  end
end
