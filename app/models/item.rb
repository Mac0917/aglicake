class Item < ApplicationRecord
	belongs_to :genre
	enum status:{sale: 0,notsale:1 }
end
