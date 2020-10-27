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
    validates :email, presence: true, email: true, uniqueness: true
    validates :password, length: { in: 6..20 }

    def self.find_or_create_by_omniauth(auth)
        self.where(:email => auth["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
    def list_all_teachers
        Teacher.all.sort{|a,b| a.last_name <=> b.last_name}.each_with_index do |teacher,i|
            "#{i+1}. #{teacher.name}"
        end
    end
end
