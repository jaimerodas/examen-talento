class AddLockedToOpenings < ActiveRecord::Migration[5.1]
  def change
    add_column :openings, :locked, :boolean, default: false, null: false
  end
end
