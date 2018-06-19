require_relative('../db/sql_runner')
require_relative('./product.rb')
require('pry')

class Shop


  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def convert_to_cash(number)#1000
    
  end

  def stockholding_value_cost_price
    total = 0
    for item in @items
      total += (item.cost_price * item.bookstock)
    end
    return total
  end

  def stockholding_value_retail_price
    total = 0
    for item in @items
      total += (item.retail_price * item.bookstock)
    end
    return total
  end


end
