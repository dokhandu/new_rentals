class AddNosOfApplicantsToUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :nos_of_applicants, :integer, default: 0
  end
end
