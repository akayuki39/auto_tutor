class CreateTaskChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :task_choices do |t|
      t.integer :task_id
      t.integer :choice_id

      t.timestamps
    end
  end
end
