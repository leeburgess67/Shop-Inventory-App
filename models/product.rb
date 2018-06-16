require_relative('../db/sql_runner')
require_relative('./shop.rb')
require('pry-byebug')


class Product

  attr_reader :id, :cost_price, :supplier_id
  attr_accessor :description, :retail_price, :bookstock

  def initialize(options)
    @id = options['id'].to_i
    @description = options['description']
    @cost_price = options['cost_price'].to_i
    @retail_price = options['retail_price'].to_i
    @item_markup =  (options['retail_price'].to_i) - (options['cost_price'].to_i)
    @bookstock = options['bookstock'].to_i
    @supplier_id = options['supplier_id'].to_i


  end
  #CREATE
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

  #READ
  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run( sql )
    return results.map { |product| Product.new( product ) }
  end

  #UPDATE
  def update()
    sql = "UPDATE products
    SET
    (
    description,
    cost_price,
    retail_price,
    item_markup,
    bookstock,
    supplier_id
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@description, @cost_price, @retail_price, @item_markup, @bookstock, @supplier_id, @id]
    SqlRunner.run( sql, values )
  end

  #DELETE
  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM products
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end


  def sold(qty, shop)
    @bookstock -= qty
    value = @retail_price.to_i * qty.to_i
    return shop.takings += value

  end

  def refund(qty, shop)
    @bookstock += qty
    value = @retail_price.to_i * qty.to_i
    return shop.takings -= value
  end














end
