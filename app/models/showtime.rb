class Showtime < ApplicationRecord
  belongs_to :movie
  validates :cinema, presence: true
  validates :date, presence: true
end
