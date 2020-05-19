class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status:{ 有効会員: 0, 無効会員: 1 }
  validates :last_name, presence: true, format: { with: /\A[一-龥]+\z/, message: "は漢字で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: "を漢字またはひらがなで入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力して下さい"}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力して下さい"}
  validates :post_number, presence: true, format: { with: /\A\d{7}\z/, message: "は半角でハイフンなしの7桁の数字を入力してください"}
  validates :address, presence: true,  presence: { message: "を入力してください" }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "を入力してください"}
  validates :phone_number, presence: true,  format: { with: /\A\d{10,11}\z/, message: "はハイフンなしで10桁または11桁の数字を入力してください"}
end
