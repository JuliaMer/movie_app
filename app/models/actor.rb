class Actor < ApplicationRecord
  has_many :roles
  has_many :movies, :through => :actor_movies
  validates :name, presence: true, uniqueness: {case_sensitive: false }
  validates :birthday, presence:true
end
