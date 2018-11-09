require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:three).id }
    end
    follow_redirect!
    assert_select 'h2', 'Your Cart'
    assert_select 'td', "Spider-Man"

  end

  test "should create line_item via AJAX" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:one).id },
      xhr: true
    end
    assert_response :success
    # puts @response.body
    # assert_match /<tr class=\'line-item-highlight/, @response.body
    #The assertiong above was admittedly shaky even by the books standards, expect to get
    #more info on how to test JS enabled features ~~ the big coffeescript to JS file result, which is what we were trying to
    #parse, later
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)

  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end

end
