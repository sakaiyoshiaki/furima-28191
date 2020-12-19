class Order < ApplicationRecord
  #belongs_to :item_purchase
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :postal_code,format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :house_number
    validates :building_name
    validates :tel,length: { maximum: 11}
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :prefecture_id
    end
  end

end
