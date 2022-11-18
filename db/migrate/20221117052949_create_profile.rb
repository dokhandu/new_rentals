class CreateProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.integer :salutation
      t.integer :gender
      t.string :phone
      t.string :full_name

      t.timestamps
    end
  end
end
