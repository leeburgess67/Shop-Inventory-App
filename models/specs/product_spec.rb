require("minitest/autorun")
require("minitest/rg")
require_relative("../product.rb")
require_relative("../supplier.rb")

class TestProduct < MiniTest::Test

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

  end

  def test_description()
    result = @product1.description()
    assert_equal("Heinz Baked Beans", result)
  end

  def test_cost_price()
    result = @product1.cost_price()
    assert_equal(45, result)
  end

  def test_retail_price()
    result = @product1.retail_price()
    assert_equal(75, result)
  end

  def test_bookstock()
    result = @product1.bookstock()
    assert_equal(25, result)
  end

  def test_supplier_id()
    result = @product1.supplier_id()
    assert_equal(1, result)
  end

end
