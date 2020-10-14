class Parent < ApplicationRecord
    has_secure_password

    has_many :children

    validates :name, :presence => true
    validates :phone_number, length: { is: 10 }
    validates :emergency_name, :presence => true
    validates :emergency_number, length: { in: 6..20 }
    validates :password, length: { in: 6..20 }
    validates_with EmailValidator
end
    