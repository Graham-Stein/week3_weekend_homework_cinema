require_relative("../db/sql_runner")



class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def customers()
    sql = "
    SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1;
    "

    values = [@id]

    results = SqlRunner.run(sql, values)
    customer_objects = results.map do |customer_object|
      Customer.new(customer_object)
    end
    return customer_objects
    binding.pry
  end

  def save()
    sql = "
      INSERT INTO films(
        title,
        price
      )
      VALUES (
        $1,
        $2
      )
      RETURNING id;"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()

  sql = "SELECT * FROM films"
  films = SqlRunner.run(sql)
    film_objects = films.map do |film_object|
      Film.new(film_object)
    end
    return film_objects
  end

  def self.delete_all()
  sql  = "DELETE FROM films"
  SqlRunner.run(sql)
  end

  def update()
    sql = "
      UPDATE films
      SET (
        title,
        price
      ) = ($1, $2)
      WHERE id = $3;
    "
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

end
