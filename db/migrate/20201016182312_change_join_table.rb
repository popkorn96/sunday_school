class ChangeJoinTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :assignments_children, :assignments_id, :assignments_id
    rename_column :assignments_children, :children_id, :child_id
  end
end
