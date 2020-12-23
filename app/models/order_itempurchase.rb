class OrderItempurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にハイフンを含めて下さい' }
    validates :city
    validates :house_number
    validates :tel, length: { maximum: 11 }
    validates :token
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :prefecture_id
    end
  end

  def save
    # 購入履歴を保存
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tel: tel, item_purchase_id: item_purchase.id)
  end
end
