# require 'rails_helper'
# RSpec.describe 'Player管理機能', type: :system do
#   let(:user_a) { FactoryBot.create(:user) }
#   let(:user_b) { FactoryBot.create(:user, name: 'テストユーザーB', email: 'bbb@aaa.com') }
#
#   before do
#     @player_1 = FactoryBot.create(:player, user: user_a)
#     @player_2 = FactoryBot.create(:player, free: 'よろしくお願いします！', user: user_b)
#     visit new_session_path
#     fill_in 'Eメールアドレス', with: login_user.email
#     fill_in 'パスワード', with: login_user.password
#     fill_in '確認用パスワード', with: login_user.password_confirmation
#     find('.signup_btn').click
#   end
#
#   describe 'player crud' do
#     context 'player新規作成' do
#       let(:login_user) { user_a }
#
#       it 'テストユーザーAのplayerの内容が表示される' do
#         visit new_player_path
#         click_on 'commit'
#         expect(page).to have_content '登録しました'
#       end
#     end
#     context 'player編集' do
#       let(:login_user) { user_a }
#
#       it 'テストユーザーAのplayerの内容が更新表示される' do
#         visit edit_player_path(id: @player_1)
#         fill_in 'フリーコメント', with: 'hogehoge'
#         click_on 'commit'
#         expect(page).to have_content 'hogehoge'
#       end
#     end
#     context 'player削除' do
#       let(:login_user) { user_a }
#
#       it 'テストユーザーAのplayerの内容が削除される' do
#         visit user_path(user_a)
#         click_on '削除'
#         page.driver.browser.switch_to.alert.accept
#         expect(page).to have_content '削除しました'
#       end
#     end
#   end
#
#   describe 'アクセス制限' do
#     context 'テストユーザーAがログインしている' do
#       let(:login_user) { user_a }
#
#       it 'テストユーザーBの編集ページにはアクセスできない' do
#         visit edit_player_path(id: @player_2)
#         expect(page).to have_content '他のユーザーデータは編集できません'
#       end
#     end
#   end
#
#   describe '表示制限' do
#     context 'テストユーザーAがログインしている' do
#       let(:login_user) { user_a }
#
#       it 'テストユーザーBのユーザー詳細にフォロワーリストボタンが表示されない' do
#         visit user_path(user_b)
#         expect(page).to have_no_content 'フォロー/フォロワーリスト'
#       end
#     end
#   end
# end
