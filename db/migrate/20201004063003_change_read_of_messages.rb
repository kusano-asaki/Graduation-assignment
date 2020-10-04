class ChangeReadOfMessages < ActiveRecord::Migration[5.2]
  def up
    change_column :messages, :read, :boolean, default: false
  end

  def down
    change_column :messages, :read, :boolean
  end
end
