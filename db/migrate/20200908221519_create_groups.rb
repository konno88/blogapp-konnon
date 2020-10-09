class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :user, null: false
      t.text :group_name
      t.timestamps
    end
  end
end
