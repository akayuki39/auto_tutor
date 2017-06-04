class AddAccuracyToHomeworks < ActiveRecord::Migration[5.0]
  def change
  	add_column :homeworks, :accuracy, :decimal
  end
end
