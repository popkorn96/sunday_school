class Teacher < ApplicationRecord
    include ActiveModel::Validations

    has_secure_password
    has_one :classroom
    has_many :children, :through => :classroom
    has_many :assignments

    validates :name, presence: true
    validates :phone_number, length: { is: 10 }
    validates :dl, length: { is: 8 }
    validates :volunteer, inclusion: [true, false]
    validates_with EmailValidator
    validates :password, length: { in: 6..20 }
end
