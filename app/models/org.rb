class Org < ApplicationRecord
  has_many :opps
  # acts_as_votable gem
  acts_as_votable

  def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
  end
end
end
#milly
