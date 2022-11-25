class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units, force: :cascade do |t|
      t.references :property, foreign_key: true
      t.integer :monthly_rent
      t.boolean :occupied
      t.string :unit_number
      t.integer :nos_of_bed
      t.integer :nos_of_bath
      t.string :unit_description

      t.timestamps
    end
  end
end
