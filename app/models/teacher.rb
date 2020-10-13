class Teacher < ApplicationRecord
    has_secure_password
    has_one :classroom
    has_many :children, :through => :classroom
    has_many :assignments
end
