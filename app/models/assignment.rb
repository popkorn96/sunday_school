class Assignment < ApplicationRecord
    belongs_to :teacher
    has_many :assignments_children, :class_name => 'AssignmentsChildren'
    has_many :children, through: :assignments_children
    accepts_nested_attributes_for :assignments_children

    validates :title, :presence => true
    validates :description, :presence => true
    validates :due_date, :presence => true

end
