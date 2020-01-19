class CreateDeclarations < ActiveRecord::Migration[5.2]
  def change
    create_table :declarations do |t|
      t.string :what
      t.string :why
      t.string :time

      t.timestamps
    end
  end
end
