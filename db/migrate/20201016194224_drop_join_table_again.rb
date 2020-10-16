class DropJoinTableAgain < ActiveRecord::Migration[6.0]
  def change
    drop_table :assignments_children
  end
end
