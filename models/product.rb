require_relative('../db/sql_runner')

class Product

  attr_reader :id, :cost_price
  attr_accessor :description, :retail_price

  def initialize(options)
    @id = options['id'].to_i
    @description = options['description']
    @cost_price = options['cost_price'].to_i
    @retail_price = options['retail_price'].to_i
    @item_markup = options['item_markup'].to_i
    @bookstock = options['bookstock'].to_i
    @supplier_id = options['supplier_id'].to_i


  end

  def save()
    sql = "INSERT INTO products
    (
      description,
      cost_price,
      retail_price,
      item_markup,
      bookstock,
      supplier_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@description, @cost_price, @retail_price, @item_markup, @bookstock, @supplier_id]
    product = SqlRunner.run(sql, values).first
    @id = product['id'].to_i
  end
