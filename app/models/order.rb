class Order < ApplicationRecord
  belongs_to :item_purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :postal_code,format:{with:/\A\d{3}[_]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :building_name
    validates :tel,length: {minimum: 11}
  end
end
