class DropRooms < ActiveRecord::Migration[6.0]
  def change
    drop_table :rooms
  end
end
