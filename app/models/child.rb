class Child < ApplicationRecord
    belongs_to :classroom
    belongs_to :parent
    has_many_and_belongs_to :assignment
end
