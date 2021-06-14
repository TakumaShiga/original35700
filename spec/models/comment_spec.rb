require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end
    it 'commentが存在すれば投稿できること' do
      expect(@comment).to be_valid
    end

    it 'commentが空では投稿できないこと' do
      @comment.comment = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Commentを入力してください")
    end

    it 'tweetが紐づいていないと投稿できないこと' do
      @comment.tweet = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Tweetを入力してください")
    end

    it 'userが紐づいていないと投稿できないこと' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Userを入力してください")
    end
  end
end
