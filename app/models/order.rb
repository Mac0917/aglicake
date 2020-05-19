class Order < ApplicationRecord

  belongs_to :member
  belongs_to :order_item

  # enum payment_methods: { bank: 0, credit: 1 } 支払い情報用
  enum status: { waiting: 0, paid: 1, production: 2, delivery: 3, delivered: 4 }
  

end
