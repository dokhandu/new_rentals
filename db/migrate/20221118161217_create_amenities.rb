class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities, force: :cascade do |t|
      t.references :amenitable, polymorphic: true
      t.integer :sat_type
      t.string :sat_details
      t.string :at_type
      t.string :at_details

      t.timestamps
    end
  end
end
