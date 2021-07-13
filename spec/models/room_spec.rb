require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
   before do
    @room = FactoryBot.build(:room)
   end

  it 'nameが存在すれば保存できること' do
    expect(@room).to be_valid
  end

  it 'nameが空だと保存できないこと' do
    @room.name = ""
    @room.valid?
    expect(@room.errors.full_messages).to include("Nameを入力してください")
  end

 end
end
