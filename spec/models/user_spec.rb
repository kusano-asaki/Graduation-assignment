require 'rails_helper'
RSpec.describe 'User管理機能', type: :model do
  describe 'バリデーション' do
    context '文字数制限' do
      it 'user_nameが31文字以上ならバリデーションが通らない' do
        user = User.new(name: 'a' * 31, email: 'sample@sss.com', password: 'password', password_confirmation: 'password')
        expect(user).not_to be_valid
      end
      it 'user_emailが31文字以上ならバリデーションが通らない' do
        user = User.new(email: 'a' * 256 + '@aaa.com')
        expect(user).not_to be_valid
      end
      it 'user_emailがformat以外ならバリデーションが通らない' do
        user = User.new(email: 'aaaaaaaa')
        expect(user).not_to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
      end
      it 'user_passwordが5文字以下ならバリデーションが通らない' do
        user = User.new(name: 'sample',email: 'sample@sss.com', password: 'aaaaa', password_confirmation: 'aaaaa')
        expect(user).not_to be_valid
      end
    end

    context '空白' do
      it 'nameが空ならバリデーションが通らない' do
        user = User.new(name: '', email: 'sample@sss.com', password: 'password', password_confirmation: 'password')
        expect(user).not_to be_valid
      end
      it 'emailが空ならバリデーションが通らない' do
        user = User.new(email: '')
        expect(user).not_to be_valid
      end
      it 'passwordが空ならバリデーションが通らない' do
        user = User.new(name: 'sample', email: 'sample@sss.com', password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
      it 'password_confirmationが空ならバリデーションが通らない' do
        user = User.new(name: 'sample', email: 'sample@sss.com', password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
    end

    context '重複' do
      before do
        @user = User.new(email: 'abc@aaa.com')
        @other = User.new(email: 'abc@aaa.com')
      end
      it 'emailが重複している場合は無効であること' do
        @user =  @other
        expect(@user.valid?).to eq(false)
      end
    end
  end
end
