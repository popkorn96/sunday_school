class Assignment < ApplicationRecord
    belongs_to :teacher
    has_and_belongs_to_many :children
    

    def last_updated
        updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    end
end
