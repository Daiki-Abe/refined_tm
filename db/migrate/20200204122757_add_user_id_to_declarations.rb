class AddUserIdToDeclarations < ActiveRecord::Migration[5.2]
  def change
    add_column :declarations, :user_id, :integer
  end
end
