require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '#create' do
    before do
      @question = FactoryBot.build(:question)
    end

    it 'titleとpostが存在すれば投稿できること' do
      expect(@question).to be_valid
    end

    it 'titleがなければ投稿できないこと' do
      @question.title = ''
      @question.valid?
      expect(@question.errors.full_messages).to include('Titleを入力してください')
    end

    it 'postがなければ投稿できないこと' do
      @question.post = ''
      @question.valid?
      expect(@question.errors.full_messages).to include('Postを入力してください')
    end

    it 'titleが100文字を超えるとき投稿できないこと' do
      @question.title = 'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量'
      @question.valid?
      expect(@question.errors.full_messages).to include('Titleは100文字以内で入力してください')
    end

    it 'postが600文字を超えるとき投稿できないこと' do
      @question.post = 'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を'
      @question.valid?
      expect(@question.errors.full_messages).to include('Postは600文字以内で入力してください')
    end

    it 'userが紐づいていないと投稿できないこと' do
      @question.user = nil
      @question.valid?
      expect(@question.errors.full_messages).to include('Userを入力してください')
    end
  end
end
