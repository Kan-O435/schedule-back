class CreateSharedPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :shared_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
