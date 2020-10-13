class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :title
      t.string :description
      t.integer :teacher_id

      t.timestamps
    end
  end
end
