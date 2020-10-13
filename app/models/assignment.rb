class Assignment < ApplicationRecord
    belongs_to :teacher
    has_many_and_belongs_to :children
end
