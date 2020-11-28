class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :from_area
  belongs_to :deliver_leadtime
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shipping_charges_id, numericality: { other_than: 1 }
    validates :from_area_id, numericality: { other_than: 1 }
    validates :deliver_leadtime_id, numericality: { other_than: 1 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user_id
  end
end
