class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  enum status:{有効: true,無効:false }

end
