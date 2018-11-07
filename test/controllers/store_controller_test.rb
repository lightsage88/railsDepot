require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select 'nav.side_nav a', minimum: 4
    assert_select 'main ul.catalog li', 3
    assert_select 'h2', 'Spider-Man'
    assert_select 'h2', 'Super Smash Bros Ultimate Nintendo Switch Bundle'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
