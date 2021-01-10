class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :from_area
  belongs_to :deliver_leadtime
  has_one_attached :image

  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
    validates :title, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :from_area_id
      validates :deliver_leadtime_id
    end
  end
end
