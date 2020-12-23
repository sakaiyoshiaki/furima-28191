require 'rails_helper'

describe OrderItempurchase do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order_itempurchase)
    end
    it '全て入力されていればOK' do
      expect(@order).to be_valid
    end
    it 'tokenが空ならNG' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('カード情報を入力してください')
    end
    it 'postal_codeが空ならNG' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors[:postal_code]).to include('を入力してください')
    end
    it 'prefecture_idが1ならNG' do
      @order.prefecture_id = '1'
      @order.valid?
      expect(@order.errors[:prefecture_id]).to include('を選択してください')
    end
    it 'cityが空ならNG' do
      @order.city = nil
      @order.valid?
      expect(@order.errors[:city]).to include('を入力してください')
    end
    it 'house_numberが空ならNG' do
      @order.house_number = nil
      @order.valid?
      expect(@order.errors[:house_number]).to include('を入力してください')
    end
    it 'building_nameが空ならNG' do
      @order.building_name = nil
      @order.valid?
      expect(@order.errors[:building_name]).to include('を入力してください')
    end
    it 'telが空ならNG' do
      @order.tel = nil
      @order.valid?
      expect(@order.errors[:tel]).to include('を入力してください')
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないとNG' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('郵便番号にハイフンを含めて下さい')
    end
    it 'telが11桁より大きいならNG' do
      @order.tel = '080123456789' # 12文字
      @order.valid?
      expect(@order.errors[:tel]).to include('は11文字以内で入力してください')
    end
  end
end
