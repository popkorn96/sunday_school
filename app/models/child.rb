class Child < ApplicationRecord
    belongs_to :classroom
    belongs_to :parent
    has_many_and_belongs_to :assignment

    validates :name, presence: => true
    validates :age, :numericality=> true, :inclusion => {:in => 6..18, :message => "Value should be between 6 and 18."}
    validates :favorite_color, presence: => true

    scope :search, -> (query) { where("LOWER(name) LIKE ?", "%#{query.downcase}%").order(:name) }

    def to_s
        self.first_name + " " + self.last_name
    end
    def last_updated
        updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    end
end
