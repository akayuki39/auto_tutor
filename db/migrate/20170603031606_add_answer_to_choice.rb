class AddAnswerToChoice < ActiveRecord::Migration[5.0]
  def change
  	add_column :choices, :answer, :text
  end
end
