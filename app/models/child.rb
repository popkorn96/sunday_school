class Child < ApplicationRecord
    belongs_to :classroom
    belongs_to :parent
    has_many_and_belongs_to :assignment

    validates :name, presence: => true
    validates :age, :numericality=> true, :inclusion => {:in => 6..18, :message => "Value should be between 6 and 18."}
    validates :favorite_color, presence: => true

    scope :search, -> (query) { where("LOWER(name) LIKE ?", "%#{query.downcase}%").order(:name) }
end
