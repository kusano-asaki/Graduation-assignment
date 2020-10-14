# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |n|
  User.create!(
    email: "seedsample#{n + 1}@test.com",
    name: "seed-#{n + 1}",
    password: "password",
    password_confirmation: "password"
  )
end

legend_num = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
platform_num = [0,1,2]
voice_chat_num = [0,1]
rank_num = [0,1,2,3,4,5,6]
favorite_weapon_name = ["G7","ウィングマン","オルタネーター","マスティフ"]
user_num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

20.times do |n|
  l_nu = legend_num.sample
  p_nu = platform_num.sample
  v_nu = voice_chat_num.sample
  r_nu = rank_num.sample
  f_na = favorite_weapon_name.sample
  u_nu = user_num.sample
  Player.create!(
    legend: l_nu,
    platform: p_nu,
    voice_chat: v_nu,
    play_style: "enjoy",
    time_to_play: "2020-10-09 12:00:00",
    favorite_weapon: f_na,
    rank: r_nu,
    killdeath_point: 1.5,
    free: "よろしくお願いします",
    user_id: u_nu
  )
end

puts "20件データ作成完了"
