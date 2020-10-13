class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.datetime :due_date
      t.boolean :complete, default: false
      t.integer :teacher_id
      t.integer :child_id

      t.timestamps
    end
  end
end
