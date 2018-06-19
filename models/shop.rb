require_relative('../db/sql_runner')
require_relative('./product.rb')
require('pry')

class Shop


  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def convert_to_cash(number)#1000
    pounds = number/100.0 #100.00
    return "£#{pounds}"
  end

  def stockholding_value_cost_price
    total = 0
    for item in @items
      total += (item.cost_price * item.bookstock)
    end
    return convert_to_cash(total)
  end

  def stockholding_value_retail_price
    total = 0
    for item in @items
      total += (item.retail_price * item.bookstock)
    end
    return convert_to_cash(total)
  end


end
