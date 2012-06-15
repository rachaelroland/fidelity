class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_attributes
  
  class << self
    def destroy_by_name( name )
      Product.destroy_all(name: name)
    end
    
    def match_by_attributes( attributes )
      Product.joins(:product_attributes).where('item_attribute IN (?)', attributes).group('products.id')
    end
  end
end


