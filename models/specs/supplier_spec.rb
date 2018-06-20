require("minitest/autorun")
require("minitest/rg")
require_relative("../supplier.rb")

class TestSupplier < MiniTest::Test

  def setup
    options = ({
      "name" => "Fender UK",
      "email" => "sales@fender.co.uk",
      "phone" => "01311346542"
    })

    @supplier1 = Supplier.new(options)
  end

    def test_get_name
      result = @supplier1.name()
      assert_equal("Fender UK", result)
    end

    def test_get_email()
      result = @supplier1.email()
      assert_equal("sales@fender.co.uk", result)
    end


end
