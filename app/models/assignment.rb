class Assignment < ApplicationRecord
    belongs_to :teacher, :optional => true
    has_and_belongs_to_many :children

    validates :title, :presence => true
    validates :description, :presence => true
    validates :due_date, :presence => true
    

    def last_updated
        updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    end
end
