class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |i|
      i.integer :post_id
      i.integer :user_id
      i.string  :body
    end
  end
end
