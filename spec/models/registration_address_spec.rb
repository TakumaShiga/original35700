require 'rails_helper'

RSpec.describe RegistrationAddress, type: :model do
  describe 'エントリー情報の保存' do
    before do
      user = FactoryBot.create(:user)
      event = FactoryBot.create(:event)
      @registration_address = FactoryBot.build(:registration_address, user_id: user.id, event_id: event.id)
      sleep 0.1
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@registration_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @registration_address.building_name = ''
        expect(@registration_address).to be_valid
      end
    end
    sleep 0.1
    context '内容に問題がある場合' do
      it 'tokenが空では保存できないこと' do
        @registration_address.token = nil
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('カード情報を入力してください')
      end

      it 'postal_codeが空だと保存できないこと' do
        @registration_address.postal_code = ''
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('郵便番号を入力してください')
      end

      it 'postal_codeが半角のハイフンを含んでないと保存できないこと' do
        @registration_address.postal_code = '1234567'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('郵便番号はハイフンを含む半角数字で入力してください')
      end

      it 'postal_codeが半角英字の場合保存できないこと' do
        @registration_address.postal_code = 'abc-defg'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('郵便番号はハイフンを含む半角数字で入力してください')
      end

      it 'postal_codeが全角ひらがなの場合保存できないこと' do
        @registration_address.postal_code = 'あいうーえおかき'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('郵便番号はハイフンを含む半角数字で入力してください')
      end

      it 'postal_codeが全角カタカナの場合保存できないこと' do
        @registration_address.postal_code = 'アイウーエオカキ'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('郵便番号はハイフンを含む半角数字で入力してください')
      end

      it 'postal_codeが全角数字の場合保存できないこと' do
        @registration_address.postal_code = '１２３−４５６７'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('郵便番号はハイフンを含む半角数字で入力してください')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @registration_address.prefecture_id = ''
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('都道府県を選択してください')
      end

      it 'cityが空だと保存できないこと' do
        @registration_address.city = ''
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('市区町村を入力してください')
      end

      it 'place_numberが空だと保存できないこと' do
        @registration_address.place_number = ''
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('番地を入力してください')
      end

      it 'phone_numberが空だと保存できないこと' do
        @registration_address.phone_number = ''
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('電話番号を入力してください')
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @registration_address.phone_number = '123456789012'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('電話番号は10桁もしくは11桁で入力してください')
      end

      it 'phone_numberが10桁未満だと保存できないこと' do
        @registration_address.phone_number = '123456789'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('電話番号は10桁もしくは11桁で入力してください')
      end

      it 'phone_numberが半角英字だと保存できないこと' do
        @registration_address.phone_number = 'abcdefghijk'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('電話番号は数値で入力してください')
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @registration_address.phone_number = '１２３４５６７８９０１'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('電話番号は数値で入力してください')
      end

      it 'phone_numberが全角ひらがなだと保存できないこと' do
        @registration_address.phone_number = 'あいうえおかきくけこさ'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('電話番号は数値で入力してください')
      end

      it 'phone_numberが全角カタカナだと保存できないこと' do
        @registration_address.phone_number = 'アイウエオカキクケコサ'
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('電話番号は数値で入力してください')
      end

      it 'userと紐付いていないと保存できないこと' do
        @registration_address.user_id = nil
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('Userを入力してください')
      end

      it 'eventと紐づいていないと保存できないこと' do
        @registration_address.event_id = nil
        @registration_address.valid?
        expect(@registration_address.errors.full_messages).to include('Eventを入力してください')
      end
    end
  end
end
