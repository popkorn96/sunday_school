class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.string :favorite_color
      t.integer :classroom_id
      t.integer :parent_id
      t.integer :assignment_id

      t.timestamps
    end
    create_table :assignments_children, id: false do |t|
      t.belongs_to :child
      t.belongs_to :assignment
    end
  end
end
