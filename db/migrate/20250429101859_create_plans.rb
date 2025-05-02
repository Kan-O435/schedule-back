class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|

      t.string :title
      t.text :content
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true #該当するユーザーの情報を持ってくるらしい

      t.timestamps
    end
  end
end
