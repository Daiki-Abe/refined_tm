class AddEndToDeclarations < ActiveRecord::Migration[5.2]
  def change
    add_column :declarations, :end, :string, null: false
  end
end
