class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.integer :course_id
      t.integer :teacher_id
      t.text :question
      t.text :a
      t.text :b
      t.text :c
      t.text :d
      t.text :knowledge

      t.timestamps
    end
  end
end
