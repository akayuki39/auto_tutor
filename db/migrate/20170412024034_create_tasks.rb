class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :task_name
      t.date :start_time
      t.date :finish_time
      t.integer :course_id

      t.timestamps
    end
  end
end
