class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |i|
      i.string :title
      i.string :url
    end
  end
end
