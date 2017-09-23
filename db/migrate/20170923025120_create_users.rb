class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.boolean :admin, default: false
      t.boolean :active, default: true
      t.datetime :last_sign_in_at
      t.timestamps
      t.index :uid, unique: true
    end
  end
end
