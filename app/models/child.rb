class Child < ApplicationRecord
    belongs_to :classroom
    belongs_to :parent, :optional => true
    has_and_belongs_to_many :assignments
    
    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :age, :numericality=> true, :inclusion => {:in => 6..18, :message => "should be between 6 and 18."}
    validates :favorite_color, :presence => true

    scope :search, -> (query) { where("LOWER(name) LIKE ?", "%#{query.downcase}%").order(:name) }
end
