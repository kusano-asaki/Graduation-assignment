require 'rails_helper'
RSpec.describe 'User管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user) }
  let(:user_b) { FactoryBot.create(:user, name: 'テストユーザーB', email: 'bbb@aaa.com') }
  before do
    @player_2 = FactoryBot.create(:player, free: 'よろしくお願いします！', user: user_b)
  end

  describe '新規作成' do
    context 'サインアップする' do
      it 'サインアップ後同時ログインしてマイページが表示される' do
        visit new_user_path
        fill_in 'お名前', with: 'testc'
        fill_in 'Eメールアドレス', with: 'test@ttt.com'
        fill_in 'パスワード', with: 'password'
        find('.signup_btn').click
        expect(page).to have_content 'user登録,ログインしました'
      end
    end
  end

  describe 'アクセス制限' do
    context 'ユーザーがログインしていない場合' do
      it 'アプリ機能の画面へはアクセスできない' do
        visit players_path
        expect(page).to have_content 'アプリをご利用になるにはログインしてください'
      end
    end
  end

  # 以下失敗
  describe '新規作成' do
    before do
      visit new_session_path
      fill_in 'Eメールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      find('.signup_btn').click
    end
    context 'ログイン失敗' do
      let(:login_user) { user_a }

      it '失敗のメッセージが表示される' do
        click_on 'ログアウト'
        find('.signup_btn').click
        expect(page).to have_content 'ログインに失敗しました'
      end
    end
  end

  describe 'フォロー機能' do
    before do
      visit new_session_path
      fill_in 'Eメールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      find('.signup_btn').click
    end

    context 'テストユーザーAがログインしている' do
      let(:login_user) { user_a }

      it 'テストユーザーBをフォローする' do
        visit players_path
        binding.irb
        first('.player_btn').click
        first('.player-profile-btn').click
        click_on 'フォローする'
        click_on 'マイページ'
        click_on 'フォロー/フォロワーリスト'
        expect(page).to have_content 'テストユーザーB'
      end
    end
    context 'テストユーザーAがログインしている' do
      let(:login_user) { user_a }
      before do
        visit players_path
        first('.player_btn').click
        first('.player-profile-btn').click
        click_on 'フォローする'
      end

      it 'テストユーザーBをフォロー解除する' do
        visit players_path
        first('.player_btn').click
        first('.player-profile-btn').click
        click_on 'フォロー解除'
        click_on 'マイページ'
        click_on 'フォロー/フォロワーリスト'
        expect(page).to have_no_content 'テストユーザーB'
      end
    end
  end

  describe 'メッセージ機能' do
    before do
      visit new_session_path
      fill_in 'Eメールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      find('.signup_btn').click
    end
    context 'テストユーザーAがログインしている' do
      let(:login_user) { user_a }
      before do
        visit players_path
        first('.player_btn').click
        first('.player-profile-btn').click
        binding.irb
        click_on 'フォローする'
      end

      it 'テストユーザーBへメッセージを送る' do
        visit user_path(user_a)
        click_on 'フォロー/フォロワーリスト'
        click_on 'メッセージ'
        fill_in 'message_body', with: 'こんにちは！'
        click_on 'メッセージ送信'
        expect(page).to have_content '未読'
      end
    end

    context 'テストユーザーAがログインしている' do
      let(:login_user) { user_a }
      before do
        visit players_path
        first('.player_btn').click
        first('.player-profile-btn').click
        click_on 'フォローする'
        click_on 'マイページ'
        click_on 'フォロー/フォロワーリスト'
        click_on 'メッセージ'
        fill_in 'message_body', with: 'こんにちは！'
        click_on 'メッセージ送信'
        click_on 'ログアウト'
        fill_in 'Eメールアドレス', with: 'bbb@aaa.com'
        fill_in 'パスワード', with: 'password'
        find('.signup_btn').click
        visit user_path(user_b)
        click_on 'フォロー/フォロワーリスト'
        click_on 'メッセージ'
        click_on 'ログアウト'
      end

      it 'メッセージを確認したら既読になっている' do
        fill_in 'Eメールアドレス', with: 'aaa@aaa.com'
        fill_in 'パスワード', with: 'password'
        find('.signup_btn').click
        click_on 'マイページ'
        click_on 'フォロー/フォロワーリスト'
        click_on 'メッセージ'
        expect(page).to have_content '既読'
      end
    end
  end
end
