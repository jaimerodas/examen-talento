class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.bigint :service_id, null: false
      t.references :opening, foreign_key: true

      t.timestamps
      t.index :email, unique: true
      t.index :service_id, unique: true
    end
  end
end
