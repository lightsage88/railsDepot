class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    #has_many :line_items >>> means that a cart can potentially
    #have many line_items. These line_items are linked to the cart because
    #each line_item contains a reference to the cart's ID.

    ##dependent: :destroy part indicates that existence of line items
    # is dependent on the existence of the cart. If we destroy a cart, we want Rails
    # to also destroy any line items that are associated with that cart.
    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end
end
