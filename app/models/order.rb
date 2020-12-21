class Order < ApplicationRecord
  belongs_to :item_purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
