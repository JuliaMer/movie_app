class Movie < ApplicationRecord
  has_many :roles
  has_many :actors, :through => :actor_movies
  validates :title, presence: true, uniqueness: {case_sensitive: false }
  validates :year, presence: true
end
