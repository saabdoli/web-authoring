class AddPostIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :post, index: true
  end
end
