class Item < ApplicationRecord
    belongs_to :genre
    belongs_to :order
	 has_many :carts, dependent: :destroy
        def cart_by?(member)
            cart.where(member_id: member.id).exists?
        end
	enum status:{販売中: 0,販売不可:1 }
end
