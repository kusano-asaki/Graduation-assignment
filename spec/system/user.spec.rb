require 'rails_helper'
RSpec.describe 'User管理機能', type: :system do
    let(:user_a) { FactoryBot.create(:user) }
    let(:user_b) { FactoryBot.create(:user, name: 'テストユーザーB', email: 'bbb@aaa.com') }

    before do
      @player_2 = FactoryBot.create(:player, free: 'よろしくお願いします！', user: user_b)
      visit new_session_path
      fill_in 'Eメールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      fill_in '確認用パスワード', with: login_user.password_confirmation
      find('.signup_btn').click
      end

    describe '新規作成' do
      context 'サインアップする' do
        it 'サインアップ後同時ログインしてマイページが表示される' do
          visit new_user_path
          fill_in 'お名前', with: 'testc'
          fill_in 'Eメールアドレス', with: 'test@ttt.com'
          fill_in 'パスワード', with: 'password'
          fill_in '確認用パスワード', with: 'password'
          find('.signup_btn').click
          expect(page).to have_content 'user登録,ログインしました'
        end
      end
    end

    describe 'フォロー機能' do
      context 'テストユーザーAがログインしている' do
        let(:login_user) { user_a }

        it 'テストユーザーBさんをフォローする' do
          visit players_path
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

        it 'テストユーザーBさんをフォロー解除する' do
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
end
