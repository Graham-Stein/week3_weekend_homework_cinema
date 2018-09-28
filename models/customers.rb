require_relative("../db/sql_runner")


class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end


  def save()
    sql = "
      INSERT INTO customers(
        name,
        funds
      )
      VALUES (
        $1,
        $2
      )
      RETURNING id;"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()

  sql = "SELECT * FROM customers"
  customers = SqlRunner.run(sql)
    customer_objects = customers.map do |customer_object|
      Customer.new(customer_object)
    end
    return customer_objects
  end

  def self.delete_all()
  sql  = "DELETE FROM customers"
  SqlRunner.run(sql)
  end

  def update()
    sql = "
      UPDATE customers
      SET (
        name,
        funds
      ) = ($1, $2)
      WHERE id = $3;
    "
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

end
