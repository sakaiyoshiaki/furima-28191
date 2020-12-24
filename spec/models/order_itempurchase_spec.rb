require 'rails_helper'

describe OrderItempurchase do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order_itempurchase)
      @order.user_id = 1
      @order.item_id = 2
    end

    context '商品購入ができる時' do
      it '全て入力されていればOK' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品購入ができない時' do
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
      it 'prefecture_idが空ならNG' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors[:prefecture_id]).to include('を入力してください')
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
      it 'telにハイフンが含まれるとNG' do
        @order.tel = '080-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号にハイフンは不要です')
      end
      it 'user_idが空ならNG' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors[:user_id]).to include('を入力してください')
      end
      it 'item_idが空ならNG' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors[:item_id]).to include('を入力してください')
      end
    end
  end
end
