class RenameNameToPostNameInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :name, :posts_name
  end
end
