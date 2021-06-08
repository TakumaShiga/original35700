require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '#create' do
    before do
      @tweet = FactoryBot.build(:tweet)
    end
    it 'textとimageが存在すれば投稿できること' do
      expect(@tweet).to be_valid
    end

    it 'imageが空でも投稿できること' do
      @tweet.images = nil
      expect(@tweet).to be_valid
    end

    it 'textが空では投稿できないこと' do
      @tweet.text = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("テキストを入力してください")
    end
  end
end
