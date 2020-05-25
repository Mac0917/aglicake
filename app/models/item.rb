class Item < ApplicationRecord
    belongs_to :genre
    belongs_to :order, optional: true
    attachment :item_image
	 has_many :carts, dependent: :destroy
        def cart_by?(member)
            cart.where(member_id: member.id).exists?
        end
    enum status:{販売中: 0,販売不可:1 }
    validates :name, presence: { message: "を入力してください" }
    validates :name, uniqueness: { message: "はすでに登録されています 違う名前の商品を登録してください"}
    validates :explanation, presence: { message: "を入力してください" }
    validates :excluded, format: { with: /\A[0-9０-９]+\z/, message: "は数値を入力してください"}

end
