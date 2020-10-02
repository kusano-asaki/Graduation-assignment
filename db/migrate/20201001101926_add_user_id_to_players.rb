class AddUserIdToPlayers < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM players';
    add_reference :players, :user, null: false, index: true
  end

  def down
    remove_reference :players, :user, index: true
  end
end
