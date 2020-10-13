class AddPasswordsToTeachersAndParents < ActiveRecord::Migration[6.0]
  def change
    add_column :parents, :password_digest, :string
    add_column :teachers, :password_digest, :string
  end
end
