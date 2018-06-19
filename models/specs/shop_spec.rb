require("minitest/autorun")
require("minitest/rg")
require_relative("../product.rb")
require_relative("../supplier.rb")
require_relative("../shop.rb")


class TestShop < MiniTest::Test

  def setup

    options = ({
      "name" => "Cool Beanz Co",
      "email" => "coolbeanz@unilever.com",
      'id' => 1
      })
      @supplier1 = Supplier.new(options)

  options = ({
    "description" => "Heinz Baked Beans",
      "cost_price" => 45,
      "retail_price" => 75,
      "bookstock" => 25,
      "supplier_id" => @supplier1.id
      })

      @product1 = Product.new(options)
  options = ({
    "description" => "Heinz",
      "cost_price" => 33,
      "retail_price" => 75,
      "bookstock" => 25,
      "supplier_id" => @supplier1.id
      })

      @product2 = Product.new(options )

      items = [@product1, @product2]
  @shop = Shop.new(items)
  end

  def test_shop_has_items
    result = @shop.items()
    assert_equal([@product1, @product2], result)
  end












end
