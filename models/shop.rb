require_relative('../db/sql_runner')
require_relative('./product.rb')
require('pry')

class Shop


  attr_accessor :items

  def initialize(items)
    @items = items
  end


end
