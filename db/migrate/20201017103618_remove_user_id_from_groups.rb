class RemoveUserIdFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_reference :groups, :user
  end
end
