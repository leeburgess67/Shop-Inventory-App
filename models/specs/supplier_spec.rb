require("minitest/autorun")
require("minitest/rg")
require_relative("../supplier.rb")

class TestSupplier < MiniTest::Test

  def setup
    options = ({
      "name" => "Cool Beanz Co",
      "email" => "coolbeanz@unilever.com"
    })
    @supplier1 = Supplier.new(options)
  end

    def test_get_name
      result = @supplier1.name()
      assert_equal("Cool Beanz Co", result)
    end

    def test_get_email()
      result = @supplier1.email()
      assert_equal("coolbeanz@unilever.com", result)
    end


end
