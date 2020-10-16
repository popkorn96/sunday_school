class DropChildrenAssignments < ActiveRecord::Migration[6.0]
  def change
    drop_table :children_assignments
  end
end
