class AddStartToDeclarations < ActiveRecord::Migration[5.2]
  def change
    add_column :declarations, :start, :string, null: false
  end
end
