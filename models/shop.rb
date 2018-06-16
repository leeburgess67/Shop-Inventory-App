require_relative('../db/sql_runner')
require('pry')

class Shop

  attr_reader :id
  attr_accessor :name, :takings, :stockholding_value_cost_price, :stockholding_value_retail_price

  def initialize(options)
    @name = options['name']
    @takings = options['takings']
    @stockholding_value_cost_price = options['stockholding_value_cost_price']
    @stockholding_value_retail_price = options['stockholding_value_retail_price']
  end

end
