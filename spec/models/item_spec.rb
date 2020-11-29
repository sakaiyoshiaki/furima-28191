require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    it '全て入力されていればOK' do
      expect(@item).to be_valid
    end
    it 'titleが空ならNG' do
      @item.title = nil
      @item.valid?
      expect(@item.errors[:title]).to include('を入力してください')
    end
    it 'descriptionが空ならNG' do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include('を入力してください')
    end
    it 'priceが空ならNG' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include('を入力してください')
    end

    it 'category_idが1ならNG' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors[:category_id]).to include('を選択してください')
    end
    it 'status_idが1ならNG' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors[:status_id]).to include('を選択してください')
    end
    it 'shipping_charge_idが1ならNG' do
      @item.shipping_charge_id = '1'
      @item.valid?
      expect(@item.errors[:shipping_charge_id]).to include('を選択してください')
    end
    it 'from_area_idが1ならNG' do
      @item.from_area_id = '1'
      @item.valid?
      expect(@item.errors[:from_area_id]).to include('を選択してください')
    end
    it 'deliver_leadtime_idが1ならNG' do
      @item.deliver_leadtime_id = '1'
      @item.valid?
      expect(@item.errors[:deliver_leadtime_id]).to include('を選択してください')
    end

    it 'titleが40文字以上ならNG' do
      @item.title = 'ややややややややややややややややややややややややややややややややややややややややや' # 41文字
      @item.valid?
      expect(@item.errors[:title]).to include('は40文字以内で入力してください')
    end
    it 'descriptionが1000文字超過ならNG' do
      @item.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' # 1001文字
      @item.valid?
      expect(@item.errors[:description]).to include('は1000文字以内で入力してください')
    end

    it 'priceがinteger以外ならNG' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors[:price]).to include('は数値で入力してください')
    end
    it 'priceが300円未満ならNG' do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include('は300以上の値にしてください')
    end
    it 'priceが9999999円より高額ならNG' do
      @item.price = 19_999_999
      @item.valid?
      expect(@item.errors[:price]).to include('は9999999以下の値にしてください')
    end
  end
end
