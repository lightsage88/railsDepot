class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    #replace multiple items for a single product in a cart
    #with a single item
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity| 
        if quantity > 1
          #remove individual clone items
          cart.line_items.where(product_id: product_id).delete_all
          #replace with a single item that has a higher quantity
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
