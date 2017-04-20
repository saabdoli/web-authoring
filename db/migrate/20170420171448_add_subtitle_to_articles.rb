class AddSubtitleToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :subtitle, :text
  end
end
