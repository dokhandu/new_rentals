class CreateMaintenance < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.references :tenant, foreign_key: true
      t.references :property, foreign_key: true
      t.integer :priority
      t.integer :state
      t.integer :request_type
      t.datetime :request_date
      t.string :descriptions
      t.string :request_title

      t.timestamps
    end
  end
end

