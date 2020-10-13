class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :phone_number
      t.string :email
      t.integer :dl
      t.boolean :volunteer, default: false

      t.timestamps
    end
  end
end
