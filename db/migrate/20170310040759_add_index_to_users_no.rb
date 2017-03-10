class AddIndexToUsersNo < ActiveRecord::Migration[5.0]
  def change
  	add_index :users, :no, unique: true
  end
end
