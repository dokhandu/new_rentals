class CreateRole < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.integer :role_name

      t.timestamps
    end
  end
end
