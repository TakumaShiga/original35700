require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe '#create' do
    before do
      @answer = FactoryBot.build(:answer)
    end
    it 'messageがあれば投稿できること' do
      expect(@answer).to be_valid
    end

    it 'messageがなければ投稿できないこと' do
      @answer.message = ""
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Messageを入力してください")
    end

    it 'messageが500文字を超える場合投稿できないこと' do
      @answer.message = "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーで"
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Messageは500文字以内で入力してください")
    end

    it 'questionが紐づいていないと投稿できないこと' do
      @answer.question = nil
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Questionを入力してください")
    end

    it 'userが紐づいていないと投稿できないこと' do
      @answer.user = nil
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Userを入力してください")
    end
  end
end
