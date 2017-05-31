class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :homework_id
      t.integer :question_no
      t.text :content

      t.timestamps
    end
  end
end
