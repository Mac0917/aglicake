class ShippingAddress < ApplicationRecord
    belongs_to :member
    validates :post_number, presence: true, format: { with: /\A\d{7}\z/, message: "は半角でハイフンなしの7桁の数字を入力してください"}
    validates :delively_address, presence: true,  presence: { message: "を入力してください" }
    validates :delively_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: "を漢字またはひらがなで入力してください" }
end
