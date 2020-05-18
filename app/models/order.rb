class Order < ApplicationRecord

  has_many :members

  enum payment_methods: { bank: 0, credit: 1 }
  enum status: { waiting: 0, paid: 1, production: 2, delivery: 3, delivered: 4 }
  
  def name
    members.[last_name, first_name].join(' ')
  end

end
