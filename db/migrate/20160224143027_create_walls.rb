class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.string :wall_name

      t.timestamps null: false
    end
  end
end
