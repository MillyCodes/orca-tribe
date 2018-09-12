class Opp < ApplicationRecord
    belongs_to :org
    #changed from orgs to org
    has_many :user_opps
    has_many :users, through: :user_opps #volunteers
#starting to implement search
  searchable do
    text :title, :body
    text :comments do
      comments.map { |comment| comment.body }
      end

    end
  end
#milly
