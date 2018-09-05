class ChangeForCourses < ActiveRecord::Migration[5.0]
  def change
  	remove_column :courses, :teacher, :text
  end
end
