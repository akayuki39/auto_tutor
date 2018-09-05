class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.text :course_name
      t.text :teacher
      t.date :start_time
      t.date :finish_time

      t.timestamps
    end
  end
end
