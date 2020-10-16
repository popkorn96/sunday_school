class RemoveColumnsAssignAndChild < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :child_id
    remove_column :children, :assignment_id
  end
end
