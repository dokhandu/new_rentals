class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties, force: :cascade do |t|
      t.references :owner
      t.integer :property_type
      t.integer :occupancy_type
      t.string :property_name
      t.string :property_description

      t.timestamps
    end
  end
end
