require 'rails_helper'
RSpec.describe 'Player管理機能', type: :model do
  describe 'バリデーション' do
    it 'play_styleの入力が41文字以上ならバリデーションが通らない' do
      player = Player.new(play_style: 'a' * 41)
      expect(player).not_to be_valid
    end
    it 'favorite_weaponの入力が41文字以上ならバリデーションが通らない' do
      player = Player.new(favorite_weapon: 'a' * 41)
      expect(player).not_to be_valid
    end
    it 'freeの入力が251文字以上ならバリデーションが通らない' do
      player = Player.new(free: 'a' * 251)
      expect(player).not_to be_valid
    end
  end
end
