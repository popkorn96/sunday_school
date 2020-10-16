class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments_children do |t|
      t.belongs_to :assignment 
      t.belongs_to :child 
    end
  end
end
