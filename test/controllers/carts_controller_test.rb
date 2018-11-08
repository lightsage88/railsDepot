require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get carts_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end

  # test "should have 1 item quantity of two" do
  #   post line_items_url, params: { product_id: products(:two).id}
  #   @cart = Cart.find(session[:cart_id])
  #   puts "This is the cart: #{@cart}"
  #   puts @cart.
  # end
  #TODO: I can't figure out how to test unique products and duplicate products to a cart
  

  test "should destroy cart" do
    ##first we're going to post the creation of an item
    post line_items_url, params: { product_id: products(:three).id }
    @cart = Cart.find(session[:cart_id])

    #Below we assert that there will be a difference
    #in the count attribute of the cart after we 'do'
    #the underlying procedure of deleting/destroying the cart
    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end
    #in Ch.10 pg 144, we redirected instead to store_index_url
    assert_redirected_to store_index_url
  end
end
