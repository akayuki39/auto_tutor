class AddResultToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :result, :integer
  end
end
