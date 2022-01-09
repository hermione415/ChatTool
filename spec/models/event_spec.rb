require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'イベント新規登録' do
    context 'イベント新規登録ができる場合' do
      it '全て入力されていると登録できる' do
        expect(@event).to be_valid
      end
      it 'start_timeが空でも登録できる' do
        @event.start_time = ''
        expect(@event).to be_valid
      end
      it 'finish_timeが空でも登録できる' do
        @event.finish_time = ''
        expect(@event).to be_valid
      end
      it 'contentsが空でも登録できる' do
        @event.contents = ''
        expect(@event).to be_valid
      end
    end

    context 'イベント新規登録ができない場合' do
      it 'titleが空では登録できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("User must exist")
      end
    end
  end
end
