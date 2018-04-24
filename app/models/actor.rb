class Actor < ApplicationRecord
  has_many :roles
  has_many :movies, :through => :actor_movies
  validates :name, presence: true, uniqueness: {case_sensitive: false }
  validates :birthday, presence:true

  def age
    @age = ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end
end
