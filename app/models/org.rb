class Org < ApplicationRecord
  has_many :opps
  # acts_as_votable gem
  acts_as_votable
# Serach to implement here:
  searchable do
    text :name
    text :summary
  end
end

#milly
