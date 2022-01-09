require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿作成' do
    context '新規投稿が作成できる場合' do
      it '全て入力されていると登録できる' do
        expect(@post).to be_valid
      end
      it 'textが空でも登録できる' do
        @post.text = ''
        expect(@post).to be_valid
      end
    end
    context '新規投稿が作成できない場合' do
      it 'titleとimageが空では保存できない' do
        @post.title = ''
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end