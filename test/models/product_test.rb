require 'test_helper'

class ProductTest < ActiveSupport::TestCase
 fixtures :products
 test "product attributes must not be empty" do 
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?
 end

 test "product price must be positive" do
  product = Product.new(title: "The Art of Metal Gear Solid",
                    description: "Konami Art",
                    image_url: "otacon.jpg")
  product.price = -10
  assert product.invalid?
  assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

  product.price = 0
  assert product.invalid?
  assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

  product.price = 1
  assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "Hyrule Historia",
              description: "Zelda stuff!",
              price: 100,
              image_url: image_url)
  end

  test "the validity of our image_url" do
    ok = %w{ Link.gif Mario.jpg SolidSnake.png http://sony.nintendo.microsoft/a/b/c/games.gif }
    bad = %w{ CowboyBebop sammy.la.gif.chi sorry.sorry.gif.fig maximum.car }

    ok.each do |image_url|
      assert new_product(image_url).valid?, "{#image_url} should NOT be invalid"
    end

    bad.each do |bad_image_url|
      assert new_product(bad_image_url).invalid?, "{#bad_image_url} shouldn't be valid"
    end
  end #end of "the validity of our image_url test"
  
  test "product is not valid without a unique title" do
   product = Product.new(title: products(:three).title,
                     description: "yyy",
                     price: 1,
                     image_url: "spider.gif")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "that comparing the response of a faililng test against a built in error message table will work" do
    product = Product.new(
     title: products(:one).title,
     description: "Bolo",
     price: 100,
     image_url: "spider.gif"
    )
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
    #TODO: Read up on how i18n works in Rails
  end

end
