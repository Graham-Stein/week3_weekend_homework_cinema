require('pry')
require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

Ticket.delete_all
Customer.delete_all
Film.delete_all


customer1 = Customer.new({
  'name' => 'John Wayne',
  'funds' => 100
  })
customer2 = Customer.new({
  'name' => 'Sandy Toksvig',
  'funds' => 90
  })
customer3 = Customer.new({
  'name' => 'Kenneth Branagh',
  'funds' => 80
  })
customer4 = Customer.new({
  'name' => 'Orson Welles',
  'funds' => 190
  })

customer1.save
customer2.save
customer3.save
customer4.save

film1 = Film.new({
  'title' => 'Back to the Future',
  'price' => 10
  })
film2 = Film.new({
  'title' => 'Valley Uprising',
  'price' => 8
  })
film3 = Film.new({
  'title' => 'From Dusk till Dawn',
  'price' => 9
  })
film4 = Film.new({
  'title' => 'Oblivion',
  'price' => 11
  })

film1.save
film2.save
film3.save
film4.save

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket2 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })
ticket3 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film3.id
  })
ticket4 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })
ticket5 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })
ticket6 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film3.id
  })
ticket7 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id
  })
ticket8 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })
ticket9 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film3.id
  })
ticket10 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film4.id
  })

ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save
ticket7.save
ticket8.save
ticket9.save
ticket10.save


binding.pry
nil
