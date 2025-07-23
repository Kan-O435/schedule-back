class AddIsSharedToPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :is_shared, :boolean
  end
end
