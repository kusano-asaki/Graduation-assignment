class AddDefaultToPlayers < ActiveRecord::Migration[5.2]
  def up
    change_column :players, :legend, :integer, null: false, default: 0
    change_column :players, :platform, :integer, null: false, default: 0
    change_column :players, :voice_chat, :integer, null: false, default: 0
    change_column :players, :rank, :integer, null: false, default: 0
    change_column :players, :killdeath_point, :float, default: 0
  end

  def down
    change_column :players, :legend, :integer, null: false
    change_column :players, :platform, :integer, null: false
    change_column :players, :voice_chat, :integer, null: false
    change_column :players, :rank, :integer, null: false
    change_column :players, :killdeath_point, :float
  end
end
