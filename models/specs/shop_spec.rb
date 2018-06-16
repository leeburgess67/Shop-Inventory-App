require("minitest/autorun")
require("minitest/rg")
require_relative("../product.rb")
require_relative("../supplier.rb")
require_relative("../shop.rb")


class TestShop < MiniTest::Test

  def setup
    options = ({
      "name" => "ShopQwik",
      "takings" => 500,
      "stockholding_value_cost_price" => 0,
      "stockholding_value_retail_price" => 0
    })
    @shop = Shop.new(options)
  end

  def test_get_shop_name
    result = @shop.name()
    assert_equal("ShopQwik", result)
  end

  def test_get_shop_takings
    result = @shop.takings()
    assert_equal(500, result)
  end

  def test_get_shop_stockholding__cost
    result = @shop.stockholding_value_cost_price()
    assert_equal(0, result)
  end

  def test_get_shop_stockholding__retail
    result = @shop.stockholding_value_retail_price()
    assert_equal(0, result)
  end








end
