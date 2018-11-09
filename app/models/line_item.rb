class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart
  def total_price
    product.price * quantity
    #If you look in the schema, you will notice that 
    #Product has a price key,
    #LineItem has a quantity key
    #LineItem as a class is linked up with both Product and Cart
    #as a result, in this scope we can pull Product and Cart like magic,
    #but for anything that isn't innately of the LineItem schema, in this scope,
    #we will need to prefix the 'price' on line 5 with 'product'
  end

end
