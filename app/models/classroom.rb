class Classroom < ApplicationRecord
    belongs_to :teacher
    has_many :children
    has_many :assignments, :through => :children

    validates_presence_of :title
    validates_presence_of :description

    # def to_s
    #     self.first_name + " " + self.last_name
    # end
    # def last_updated
    #     updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    # end
end
