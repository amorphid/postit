class DropPostCategoriesAndAddCategoryIdToPosts < ActiveRecord::Migration
  def change
    drop_table :post_categories
    add_column :posts, :category_id, :integer
  end
end
