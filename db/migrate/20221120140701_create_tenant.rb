class CreateTenant < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      t.references :unit, foreign_key: true
      t.string :application_title
      t.string :application_detail
      t.string :cid
      t.string :current_employer
      t.string :family_composition
      t.boolean :pets
      t.integer :state, default: 0, null: false
      t.datetime :moved_in_date
      t.datetime :prefer_move_in_date

      t.timestamps
    end
  end
end
