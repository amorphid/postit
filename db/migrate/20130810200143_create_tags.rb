class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |i|
      i.integer :category_id
      i.integer :post_id
    end
  end
end
