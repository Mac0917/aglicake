class Item < ApplicationRecord
	belongs_to :genre
	 has_many :carts, dependent: :destroy
        def cart_by?(member)
            cart.where(member_id: member.id).exists?
        end
	enum status:{sale: 0,notsale:1 }
end
