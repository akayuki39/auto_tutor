class AddTeacherIdToCourses < ActiveRecord::Migration[5.0]
  def change
  	add_column :courses, :teacher_id, :integer
  end
end
