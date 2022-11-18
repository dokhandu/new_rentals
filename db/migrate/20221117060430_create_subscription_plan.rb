class CreateSubscriptionPlan < ActiveRecord::Migration[7.0]
  def change
    create_table :subscription_plans do |t|
      t.references :user, foreign_key: true
      t.integer :name

      t.timestamps
    end
  end
end
