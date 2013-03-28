require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |col|
      col.integer :id
      col.string :first_name, :last_name, :gender, :email, :phone 
      col.date   :birthday
   end
 end
end
