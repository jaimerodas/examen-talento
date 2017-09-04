class CreateOpenings < ActiveRecord::Migration[5.1]
  def change
    create_table :openings do |t|
      t.string :name, null: false
      t.bigint :service_id, null: false
      t.bigint :test_stage_id, null: false
      t.bigint :passed_stage_id, null: false
      t.timestamps

      t.index :service_id, unique: true
    end
  end
end
