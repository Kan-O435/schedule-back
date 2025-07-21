class CreateSharePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :share_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end

    add_index :share_plans,[:user_id,:plan_id],unique: true
  end
end
