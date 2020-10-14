class Classroom < ApplicationRecord
    belongs_to :teacher
    has_many :children
    has_many :assignments, :through => :children
    
    validates_presence_of :title
    validates_presence_of :description
end
