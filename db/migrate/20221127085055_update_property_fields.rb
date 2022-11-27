class UpdatePropertyFields < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :upload_as, :integer, default: 2
  end
end
