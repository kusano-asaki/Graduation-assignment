class Player < ApplicationRecord
  validates :legend, :platform, :voice_chat, :time_to_play, :rank, presence: true

  enum legend: { オクタン: 0, クリプト: 1, コースティック: 2, ジブラルタル: 3, バンガロール: 4, パスファインダー: 5, ブラッドハウンド: 6, ミラージュ: 7, ライフライン: 8, ランパート: 9, レイス: 10, レヴナント: 11, ローバ: 12, ワットソン: 13 }
  enum platform: { PS4: 0, PC: 1, Xbox: 2 }
  enum voice_chat: { やる: 0, やらない: 1 }
  enum rank: { 遊ばない: 0, ブロンズ: 1, シルバー: 2, ゴールド: 3, プラチナ: 4, ダイヤ: 5, マスター＆プレデター: 6 }

  belongs_to :user
end
