class RenameArticlesToPosts < ActiveRecord::Migration[5.0]
  def change
    rename_table :articles, :posts
  end
end
