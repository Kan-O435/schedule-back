class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :mail, null: false
      t.string :password_digest, null: false  #digestで認証化できるらしい

      t.timestamps
    end

    add_index :users, :mail, unique: true
  end
end
