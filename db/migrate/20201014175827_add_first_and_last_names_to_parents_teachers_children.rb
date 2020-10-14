class AddFirstAndLastNamesToParentsTeachersChildren < ActiveRecord::Migration[6.0]
  def change
    remove_column :parents, :name
    remove_column :children, :name
    remove_column :teachers, :name
    add_column :parents, :first_name, :string
    add_column :parents, :last_name, :string
    add_column :children, :first_name, :string
    add_column :children, :last_name, :string
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
  end
end
