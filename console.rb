require('pry')
require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')



customer1 = Customer.new({
  'name' => 'John Wayne',
  'funds' => 100
  })

customer1.save

film1 = Film.new({
  'title' => 'Back to the Future',
  'price' => 10
  })

film1.save

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket1.save

binding.pry
nil
