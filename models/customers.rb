require_relative("../db/sql_runner")


class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def buy_ticket(film)
    price = film.price
    @funds -= price
    ticket = Ticket.new({
      'customer_id' => @id,
      'film_id' => film.id
      })
    ticket.save
    self.update
  end

  def count_customer_tickets()
    sql = "
    SELECT tickets.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE customers.id = $1;
    "
    values = [@id]
    result = SqlRunner.run(sql, values)

    ticket_objects = result.map do |ticket_object|
      Ticket.new(ticket_object)
    end
    number_of_tickets = ticket_objects.length
    return number_of_tickets
  end

  def films()
    sql = "
    SELECT films.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    INNER JOIN films
    ON tickets.film_id = films.id
    WHERE customers.id = $1;
    "

    values = [@id]

    results = SqlRunner.run(sql, values)
    film_objects = results.map do |film_object|
      Film.new(film_object)
    end
    return film_objects
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
