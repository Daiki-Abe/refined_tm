class CreateDeclarations < ActiveRecord::Migration[5.2]
  def change
    create_table :declarations do |t|
      t.string :what, null: false
      t.string :why, null: false
      t.string :time, null: false

      t.timestamps null: false
    end
  end
end
