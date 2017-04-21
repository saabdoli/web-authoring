class RenameArticleIdToPostId < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :article_id, :post_id
  end
end
