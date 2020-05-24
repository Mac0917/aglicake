class Order < ApplicationRecord
  
  belongs_to :member
  has_many :items
  has_many :carts
  has_many :order_items
  enum payment_methods: { bank: 0, credit: 1 } #支払い情報用
  enum status: { waiting: 0, paid: 1, production: 2, delivery: 3, delivered: 4 }
  validates :post_number, presence: true, format: { with: /\A\d{7}\z/, message: "は半角でハイフンなしの7桁の数字を入力してください"}
  validates :delively_address, presence: true,  presence: { message: "を入力してください" }
  validates :delively_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: "を漢字またはひらがなで入力してください" }
end
