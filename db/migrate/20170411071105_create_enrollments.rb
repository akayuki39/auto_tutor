class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :course_id
      t.text :semester

      t.timestamps
    end
  end
end
