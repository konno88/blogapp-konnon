class RemoveUserIdFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_reference :entries, :group, foreign_key: true
  end
end
