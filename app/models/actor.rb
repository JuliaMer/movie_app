class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, :through => :actor_movies
  validates :name, presence: true, uniqueness: {case_sensitive: false }
end
