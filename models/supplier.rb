require_relative('../db/sql_runner')
require('pry-byebug')

class Supplier

  attr_reader :id
  attr_accessor :name, :email, :phone

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @email = options['email']
    @phone = options['phone']
  end

  #CREATE
  def save()
    sql = "INSERT INTO suppliers
    (
      name,
      email,
      phone
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @email, @phone]
    supplier = SqlRunner.run(sql, values).first
    @id = supplier['id'].to_i
  end

  #READ
  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run( sql )
    return results.map { |supplier| Supplier.new( supplier ) }
  end

  def self.find( id )
    sql = "SELECT * FROM suppliers
    WHERE id = $1"
    values = [id]
    supplier = SqlRunner.run( sql, values )
    result = Supplier.new( supplier.first )
    return result
  end

  #UPDATE
  def update()
    sql = "UPDATE suppliers
    SET
    (
    name,
    email,
    phone
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @email, @phone, @id]
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
