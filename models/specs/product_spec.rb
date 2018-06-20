require("minitest/autorun")
require("minitest/rg")
require_relative("../product.rb")
require_relative("../supplier.rb")
require_relative("../shop.rb")


class TestProduct < MiniTest::Test

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

  def test_get_description()
    result = @product1.description()
    assert_equal("Gibson Les Paul Standard", result)
  end

  def test_get_cost_price()
    result = @product1.cost_price()
    assert_equal(1000, result)
  end

  def test_get_retail_price()
    result = @product1.retail_price()
    assert_equal(1500, result)
  end

  def test_get_bookstock()
    result = @product1.bookstock()
    assert_equal(3, result)
  end

  def test_get_supplier_id()
    result = @product1.supplier_id()
    assert_equal(2, result)
  end


  def test_calculate_cost_value_stockholding
    @products = Product.all
    total = 0
    for product in @products
      total += product.cost_price
    end
    return total
  end


end
