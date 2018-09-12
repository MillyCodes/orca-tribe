class Org < ApplicationRecord
  has_many :opps

  # acts_as_votable gem
  acts_as_votable

# Serach to implement here:
  searchable do
    text :title, :summary
  end
end

#milly
