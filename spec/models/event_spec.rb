require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#create' do
    before do
      @event = FactoryBot.build(:event)
    end

    context 'イベント投稿できるとき' do
      it 'building_name以外の存在があれば投稿できること' do
        expect(@event).to be_valid
      end
    end

    context 'イベント投稿できないとき' do
      it 'event_nameが空では投稿できないこと' do
        @event.event_name = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'feeが空では投稿できないこと' do
        @event.fee = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'category_idが空では投稿できないこと' do
        @event.category_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'prefecture_idが空では投稿できないこと' do
        @event.prefecture_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'event_dateが空では投稿できないこと' do
        @event.event_date = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'start_timeが空では投稿できないこと' do
        @event.start_time = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'finish_timeが空では投稿できないこと' do
        @event.finish_time = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'descriptionが空では投稿できないこと' do
        @event.description = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'feeは半角英字では投稿できない' do
        @event.fee = 'abcdef'
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'feeは全角ひらがなでは投稿できない' do
        @event.fee = 'あいうえお'
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'feeが全角カタカナでは投稿できない' do
        @event.fee = 'アイウエオ'
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'feeが全角数字では投稿できない' do
        @event.fee = 'ＡＢＣＤＥ'
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'deadlineが空では投稿できないこと' do
        @event.deadline = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'place_numberが空では投稿できないこと' do
        @event.place_number = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end

      it 'place_nameが空では投稿できないこと' do
        @event.place_name = ''
        @event.valid?
        expect(@event.errors.full_messages).to include
      end
    end
  end
end
