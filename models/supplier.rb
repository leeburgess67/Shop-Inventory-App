require_relative('../db/sql_runner')
require('pry')

class Supplier

  attr_reader :id
  attr_accessor :name, :email

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @email = options['email']
  end

  #CREATE
  def save()
    sql = "INSERT INTO suppliers
    (
      name,
      email
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @email]
    supplier = SqlRunner.run(sql, values).first
    @id = supplier['id'].to_i
  end

  #READ
  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run( sql )
    return results.map { |supplier| Supplier.new( supplier ) }
  end

  #UPDATE
  def update()
    sql = "UPDATE products
    SET
    (
    name,
    email
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @email, @id]
    SqlRunner.run( sql, values )
  end

  #DELETE
  def self.delete_all
    sql = "DELETE FROM suppliers"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM suppliers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end











end
