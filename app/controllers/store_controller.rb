class StoreController < ApplicationController
  include Counter
  include CurrentCart
  before_action :set_cart
  before_action :counter
  def index
    @products = Product.order(:title)
  end
end
