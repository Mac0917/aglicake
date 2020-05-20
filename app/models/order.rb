class Order < ApplicationRecord

  belongs_to :member
  has_many :order_items

  # enum payment_methods: { bank: 0, credit: 1 } 支払い情報用
  enum status: { waiting: 0, paid: 1, production: 2, delivery: 3, delivered: 4 }
  
end
