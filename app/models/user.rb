require 'digest'

class User < ApplicationRecord
  has_many :movies
  validates :screen_name, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, format: {with: /\A([a-zA-Z0-9]*)@([a-zA-Z0-9])*\.(([a-zA-Z0-9]){2,3})\z/}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {in: 6..20} #, format: {with: /\A([a-zA-Z0-9]*)\z/ }
  before_save :hash_password

  def hash_password
    hashed = Digest::SHA256.hexdigest password
    self.password = hashed
  end


  def authored_movies
    list_authored_movies = []
    Movie.all.each do |movie|
      if (movie.user_id == id)
        list_authored_movies.push(movie.title)
      end
    end
    list_authored_movies
  end
end
