require("minitest/autorun")
require("minitest/rg")
require_relative("../product.rb")
require_relative("../supplier.rb")
require_relative("../shop.rb")


class TestShop < MiniTest::Test

  def setup
    options = ({
      "name" => "Fender UK",
      "email" => "sales@fender.co.uk",
      "phone" => "01311346542"
    })

    @supplier1 = Supplier.new(options)

    options = ({
      "name" => "Gibson",
      "email" => "sales@gibson.com",
      "phone" => "01414927593"
    })

    @supplier2 = Supplier.new(options)


    options = ({
      "description" => "Gibson Les Paul Standard",
      "cost_price" => 1000,
      "retail_price" => 1500,
      "bookstock" => 3,
      "supplier_id" => @supplier2.id,
      "upn" => 50321
      })

      @product1 = Product.new(options)

      options = ({
        "description" => "Fender Telecaster Deluxe",
        "cost_price" => 350,
        "retail_price" => 550,
        "bookstock" => 1,
        "supplier_id" => @supplier1.id,
        "upn" => 50847
        })

        @product2 = Product.new(options)

      items = [@product1, @product2]
      @shop = Shop.new(items)

end
  def test_shop_has_items
    result = @shop.items()
    assert_equal([@product1, @product2], result)
  end












end
