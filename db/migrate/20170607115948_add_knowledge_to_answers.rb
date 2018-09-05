class AddKnowledgeToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :knowledge, :text
  end
end
