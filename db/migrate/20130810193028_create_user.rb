class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |i|
      i.string :username
    end
  end
end
