class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :legend, null: false
      t.integer :platform, null: false
      t.integer :voice_chat, null: false
      t.string :play_style
      t.time :time_to_play, null: false
      t.string :favorite_weapon
      t.integer :rank, null: false
      t.float :killdeath_point
      t.string :free

      t.timestamps
    end
  end
end
