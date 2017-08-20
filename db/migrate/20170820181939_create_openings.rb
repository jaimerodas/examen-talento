class CreateOpenings < ActiveRecord::Migration[5.1]
  def change
    create_table :openings do |t|
      t.string :name, null: false
      t.integer :service_id, null: false
      t.integer :test_stage_id, null: false
      t.integer :passed_stage_id, null: false
      t.timestamps

      t.index :service_id, unique: true
    end
  end
end
