require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context 'ユーザー登録がうまくいくとき' do 
    it 'nickname, full_name, email, password, password_confirmation, gender, birth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end 

  context 'ユーザー登録がうまくいかないとき'
    it 'nicknameが空では登録できない' do
      @user.nickname = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空だと登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'full_nameが空では登録できない' do
      @user.full_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'full_nameが半角文字では登録できない' do
      @user.full_name = "shigatakuma"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前には全角(ひらがな、カタカナ、漢字)で入力してください")
    end

    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'password_confirmationが空だと登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordが数字だけでは登録できない' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end

    it 'passwordが英字だけでは登録できない' do
      @user.password = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end

    it 'genderが空では登録できない' do
      @user.gender = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("性別を入力してください")
    end

    it 'birth_dayが空では登録できない' do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end
