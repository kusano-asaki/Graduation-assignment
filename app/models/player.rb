class Player < ApplicationRecord
  validates :legend, :platform, :voice_chat, :time_to_play, :rank, presence: true

  enum legend: { オクタン:1, クリプト:2, コースティック:3, ジブラルタル:4, バンガロール:5, パスファインダー:6, ブラッドハウンド:7, ミラージュ:8, ライフライン:9, ランパート:10, レイス:11, レヴナント:12, ローバ:13, ワットソン:14 }
  enum platform: { PS4:1, PC:2, Xbox:3 }
  enum voice_chat: { やる:1, やらない:1 }
  enum rank: { 遊ばない:0, ブロンズ:1, シルバー:1, ゴールド:2, プラチナ:3, ダイヤ:4, マスター＆プレデター:5 }
end
