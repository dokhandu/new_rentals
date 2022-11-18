class UpdateUserFields < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :enabled, :boolean, default: false
    add_column :users, :status, :integer, default: 0
    add_reference :users, :role, foreign_key: true
  end
end
