# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 20.times do |n|
#   User.create!(
#     email: "seedsample#{n + 1}@test.com",
#     name: "seed-#{n + 1}",
#     password: "password",
#     password_confirmation: "password"
#   )
# end
#
# 20.times do |n|
#   Player.create!(
#     legend: 1,
#     platform: 1,
#     voice_chat: 1,
#     play_style: "enjoy",
#     time_to_play: "2020-10-09 12:00:00",
#     favorite_weapon: "マシンガン",
#     rank: 1,
#     killdeath_point: 1.5,
#     free: "よろしくお願いします",
#     user_id: 20
#   )
# end

20.times do |n|
  Conversation.create!(
    sender_id: 1 + n,
    recipient_id: 22
  )
end

20.times do |n|
  Message.create!(
    body: "はじめまして!",
    conversation_id: 3,
    user_id: 22,
    read: false
  )
end

20.times do |n|
  Relationship.create!(
    follower_id: 22,
    followed_id: n + 1
  )
end

puts "20件データ作成完了"
