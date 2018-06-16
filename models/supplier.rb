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

  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run( sql )
    return results.map { |supplier| Supplier.new( supplier ) }
  end

  def self.delete_all
    sql = "DELETE FROM suppliers"
    SqlRunner.run( sql )
  end

binding.pry











end
