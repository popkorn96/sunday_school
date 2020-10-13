class CreateParents < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :name
      t.integer :phone_number
      t.string :email
      t.string :emergency_name
      t.integer :emergency_number

      t.timestamps
    end
  end
end
