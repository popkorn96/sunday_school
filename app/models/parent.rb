class Parent < ApplicationRecord
    include ActiveModel::Validations
    has_secure_password

    has_many :children

    validates :name, :presence => true
    validates :phone_number, length: { is: 10 }
    validates :emergency_name, :presence => true
    validates :emergency_number, length: { in: 6..20 }
    validates :password, length: { in: 6..20 }
    validates :email, :presence => true, :email => true

    def to_s
        self.first_name + " " + self.last_name
    end
    def last_updated
        updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    end
end
    