class Parent < ApplicationRecord
    has_secure_password
    has_many :children
end
