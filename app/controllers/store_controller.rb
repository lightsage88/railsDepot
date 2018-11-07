class StoreController < ApplicationController
  include Counter
  before_action :counter
  def index
    @products = Product.order(:title)
  end
end
