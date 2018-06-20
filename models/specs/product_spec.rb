require("minitest/autorun")
require("minitest/rg")
require_relative("../product.rb")
require_relative("../supplier.rb")
require_relative("../shop.rb")


class TestProduct < MiniTest::Test

  def setup
    supplier1 = Supplier.new({
      "name" => "Fender UK",
      "email" => "sales@fender.co.uk",
      "phone" => "01311346542"
    })

    product1 = Product.new({
      "description" => "Gibson Les Paul Standard",
      "cost_price" => 1000,
      "retail_price" => 1500,
      "bookstock" => 3,
      "supplier_id" => supplier2.id,
      "upn" => 50321
      })

      items = [@product1, @product2]
  @shop = Shop.new(items)


  end

  def test_get_description()
    result = @product1.description()
    assert_equal("Heinz Baked Beans", result)
  end

  def test_get_cost_price()
    result = @product1.cost_price()
    assert_equal(45, result)
  end

  def test_get_retail_price()
    result = @product1.retail_price()
    assert_equal(75, result)
  end

  def test_get_bookstock()
    result = @product1.bookstock()
    assert_equal(25, result)
  end

  def test_get_supplier_id()
    result = @product1.supplier_id()
    assert_equal(1, result)
  end

  def test_sell_product__bookstock_decreases()
  @product1.sold(5, @shop)
  result = @product1.bookstock
  assert_equal(20, result)
  end

  def test_sell_product__shop_takings_increase_by_retail_price()
  @product1.sold(5, @shop)
  result = @shop.takings
  assert_equal(375, result)
  end

  def test_refund_product__bookstock_increases()
  @product1.refund(1, @shop)
  result = @product1.bookstock
  assert_equal(26, result)
  end


  def test_refund_product__shop_takings_decrease_by_retail_price()
  @product1.refund(1, @shop)
  result = @shop.takings
  assert_equal(-75, result)
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
