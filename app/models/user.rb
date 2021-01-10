class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :item_purchases, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :password_confirmation

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :family_name
      validates :personal_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :personal_name_kana
    end
  end
end
