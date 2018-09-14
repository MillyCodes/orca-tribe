class Org < ApplicationRecord
  has_many :opps

  # acts_as_votable gem
  acts_as_votable

  #This is for search thing --Viesturs
  def self.search(search)
    where("name ILIKE ? OR summary ILIKE ? OR borough ILIKE ?", "%#{search}", "%#{search}", "%#{search}", "%#{search}")
  end
end

#milly
