class AddTimestampsToAllTheThings < ActiveRecord::Migration
  def change
    change_table :categories do |i|
      i.timestamps
    end

    change_table :comments do |i|
      i.timestamps
    end

    change_table :posts do |i|
      i.timestamps
    end

    change_table :tags do |i|
      i.timestamps
    end

    change_table :users do |i|
      i.timestamps
    end
  end
end
