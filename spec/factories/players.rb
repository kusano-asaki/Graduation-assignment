FactoryBot.define do
  factory :player do
    legend { 1 }
    platform { 1 }
    voice_chat { 1 }
    play_style { 'enjoy' }
    time_to_play { '2020-10-09 12:00:00' }
    favorite_weapon { 'スナイパー' }
    rank { 1 }
    killdeath_point { 1.5 }
    free { 'はじめまして' }
  end
end
