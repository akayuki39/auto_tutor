class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|
      t.integer :student_id
      t.integer :task_id

      t.timestamps
    end
  end
end
