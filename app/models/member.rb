class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status:{ 有効会員: 0, 無効会員: 1 }
  has_many :shipping_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  validates :last_name, format: { with: /\A[一-龥]+\z/, message: "は漢字で入力してください" }
  validates :first_name, format: { with: /\A[一-龥ぁ-ん]/, message: "を漢字またはひらがなで入力してください" }
  validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力して下さい"}
  validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力して下さい"}
  validates :post_number, format: { with: /\A\d{7}\z/, message: "は半角でハイフンなしの7桁の数字を入力してください"}
  validates :address, presence: { message: "を入力してください" }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "を入力してください"}
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "はハイフンなしで10桁または11桁の数字を入力してください"}

  def cart_items_total_amout
    
  end

  #以下、郵便番号で住所が自動入力されるコードです
  include JpPrefecture
  jp_prefecture :post_number
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: post_number).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
