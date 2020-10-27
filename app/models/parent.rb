class Parent < ApplicationRecord
    include ActiveModel::Validations

    has_many :children

    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :phone_number, length: { is: 10 }
    validates :emergency_name, :presence => true
    validates :emergency_number, length: { is: 10 }
    validates :email, :presence => true, :email => true


end
    