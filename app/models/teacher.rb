class Teacher < ApplicationRecord
    include ActiveModel::Validations

    has_secure_password
    
    has_one :classroom
    has_many :children, :through => :classroom
    has_many :assignments

    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :phone_number, length: { is: 10 }
    validates :dl, length: { is: 8 }
    validates :volunteer, inclusion: [true, false]
    validates :email, presence: true, email: true
    validates :password, length: { in: 6..20 }

    def to_s
        self.first_name + " " + self.last_name
    end
    def last_updated
        updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    end
end
