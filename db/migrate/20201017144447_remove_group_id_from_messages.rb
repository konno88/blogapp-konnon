class RemoveGroupIdFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :messages, :group, foreign_key: true
  end
end
