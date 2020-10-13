class Classroom < ApplicationRecord
    belongs_to :teacher
    has_many :children
    has_many :assignments, :through => :children
end
