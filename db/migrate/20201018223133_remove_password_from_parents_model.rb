class RemovePasswordFromParentsModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :parents, :password_digest
  end
end
