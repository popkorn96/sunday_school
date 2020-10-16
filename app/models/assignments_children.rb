class AssignmentsChildren < ApplicationRecord
    belongs_to :assignment
    belongs_to :child
    accepts_nested_attributes_for :children
    accepts_nested_attributes_for :assignments
end
