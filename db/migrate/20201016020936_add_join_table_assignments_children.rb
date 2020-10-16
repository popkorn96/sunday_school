class AddJoinTableAssignmentsChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments_children, id: false do |t|
      t.belongs_to :child
      t.belongs_to :assignment
    end
  end
end
