require_relative('../db/sql_runner')
require_relative('./product.rb')
require('pry')

class Shop

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def convert_to_cash(number)#1000 #100.00
    return "£#{number}"
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

  def calculate_profit()
    retail_total = 0
    for item in @items
      retail_total += (item.retail_price * item.bookstock)
      @retail_total = retail_total
    end
    for item in @items
      cost_total = 0
      cost_total += (item.cost_price * item.bookstock)
      @cost_total = cost_total
      result = (@retail_total - @cost_total)
    end
    return convert_to_cash(result)
  end


end
