class AddCounterCacheToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :units_count, :integer, default: 0,  null: false
    Property.find_each do |property|
      Property.reset_counters(property.id, :units_count)
    end
  end
end
