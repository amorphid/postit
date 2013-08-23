class RenameTableTagsToPostCategories < ActiveRecord::Migration
  def change
    rename_table :tags, :post_categories
  end
end
