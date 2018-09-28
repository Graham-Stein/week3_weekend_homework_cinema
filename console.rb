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

  customer1.buy_ticket(film1)
  customer1.buy_ticket(film2)
  customer1.buy_ticket(film3)
  customer2.buy_ticket(film1)
  customer2.buy_ticket(film2)
  customer2.buy_ticket(film3)
  customer3.buy_ticket(film1)
  customer3.buy_ticket(film2)
  customer3.buy_ticket(film3)
  customer3.buy_ticket(film4)

  customer3.count_customer_tickets

  film1.count_customers

binding.pry
nil
