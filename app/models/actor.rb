class Actor < ApplicationRecord
  has_many :roles
  has_many :movies, :through => :roles
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :birthday, presence: true

  def age
    age = ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end

  def self.delete(actor, roles)
    actor.destroy
    roles.each do |role|
      role.destroy
    end
  end

  def employed
    #movies.group(:year).count
    employed_list = {}
    years = movies.select(:year).distinct
    years.each do |yr|
      mov = movies.select {|movie| movie.year == yr.year}
      employed_list[yr.year] = mov.size
    end
    employed_list
  end

def total
  sum = 0
  self.employed.each do |year, times|
    sum += times
  end
  sum
end

end
