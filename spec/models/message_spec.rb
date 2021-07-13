require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentが存在すれば投稿できること' do
      expect(@message).to be_valid
    end

    it 'contentが空の場合投稿できないこと' do
      @message.content = ""
      @message.valid?
      expect(@message.errors.full_messages).to include("メッセージを入力してください")
    end

    it 'userが紐づいていない場合、保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Userを入力してください")
    end

    it 'roomが紐づいていない場合、保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Roomを入力してください")
    end
  end
end
