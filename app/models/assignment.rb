class Assignment < ApplicationRecord
    belongs_to :teacher
    has_many_and_belongs_to :children
    

    def last_updated
        updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    end
end
