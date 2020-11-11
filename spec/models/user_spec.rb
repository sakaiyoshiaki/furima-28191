require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全て入力されていればOK' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    it 'nicknameが空ならNG' do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end
    it 'emailが空ならNG' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end
    it 'emailが意図しない形ならNG' do
      user = FactoryBot.build(:user, email: 'aaagmail.com')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end
    it 'emailが重複していたらNG' do
      user1 = FactoryBot.create(:user)
      expect(FactoryBot.build(:user, email: user1.email)).to_not be_valid
    end
    it 'passwordが空ならNG' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end
    it 'passwordが6文字よりも短ければNG' do
      user = FactoryBot.build(:user, password: 'aaa11')
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end
    it 'passwordが半角英字のみならNG' do
      user = FactoryBot.build(:user, password: 'aaaaaa')
      user.valid?
      expect(user.errors[:password]).to include # passwordメッセージなし："は不正な値です"
    end
    it 'passwordが半角数字のみならNG' do
      user = FactoryBot.build(:user, password: '1111111')
      user.valid?
      expect(user.errors[:password]).to include # passwordメッセージなし："は不正な値です"
    end
    it 'family_nameが空ならNG' do
      user = FactoryBot.build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include('を入力してください')
    end
    it 'personal_nameが空ならNG' do
      user = FactoryBot.build(:user, personal_name: nil)
      user.valid?
      expect(user.errors[:personal_name]).to include('を入力してください')
    end
    it 'family_name_kanaが空ならNG' do
      user = FactoryBot.build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include('を入力してください')
    end
    it 'personal_name_kanaが空ならNG' do
      user = FactoryBot.build(:user, personal_name_kana: nil)
      user.valid?
      expect(user.errors[:personal_name_kana]).to include('を入力してください')
    end
    it 'birthdayが空ならNG' do
      user = FactoryBot.build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include('を入力してください')
    end
  end
end
