class CreatePortalSetting < ActiveRecord::Migration[7.0]
  def change
    create_table :portal_settings do |t|
      t.references :user, foreign_key: true
      t.string :dzongkhag
      t.string :gewog
      t.integer :theme_colour

      t.timestamps
    end
  end
end
