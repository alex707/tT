class AddWallIdToPost < ActiveRecord::Migration
  def change
    add_column(:posts, :wall_id, :integer) 
  end
end
