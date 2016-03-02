class RenamePostsNameToPostNameInPosts < ActiveRecord::Migration
  def change
    rename_column(:posts, :posts_name, :post_name)
  end
end
