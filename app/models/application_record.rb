class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def to_s
    self.first_name + " " + self.last_name
  end

  def last_updated
      updated_at.utc.getlocal.strftime("Last updated %A, %b %e, at %I:%M  %p ")
  end
end
