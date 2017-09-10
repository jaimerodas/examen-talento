class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.text :title, null: false
      t.integer :passing_grade, null: false
      t.boolean :locked, default: false, null: false
      t.timestamps
    end

    create_table :exam_sections do |t|
      t.text :title, null: false
      t.string :type, null: false
      t.integer :max_points
      t.integer :time_to_answer
      t.timestamps
    end

    create_table :exam_questions do |t|
      t.references :exam_section, foreign_key: true
      t.integer :position
      t.text :title, null: false
      t.string :type, null: false
      t.jsonb :answers
      t.boolean :random_order, default: false
      t.timestamps
    end

    create_join_table :exams, :exam_sections do |t|
      t.integer :position
    end

    add_reference :openings, :exam, foreign_key: true

    create_table :exam_results do |t|
      t.references :exam, foreign_key: true, null: false
      t.references :candidate, foreign_key: true, null: false
      t.integer :final_grade
      t.boolean :passed
      t.datetime :started_at
      t.datetime :finished_at
      t.index :passed
    end

    create_table :section_results do |t|
      t.references :exam_result, foreign_key: true, null: false
      t.references :exam_section, foreign_key: true
      t.text :title
      t.integer :points
      t.integer :max_points
      t.integer :time_to_answer
      t.datetime :started_at
      t.datetime :finished_at
    end

    create_table :exam_answers do |t|
      t.references :section_result, foreign_key: true, null: false
      t.text :title, null: false
      t.string :type, null: false
      t.jsonb :answers
      t.text :answer
      t.integer :points
      t.timestamps
    end
  end
end
