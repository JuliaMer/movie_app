class Showtime < ApplicationRecord
  belongs_to :movie
  #validates :cinema, presence: true #no need to validate because of lambda in movie.rb
  #validates :date, presence: true
end
