class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  validates :title, presence: true, uniqueness: {case_sensitive: false }
end
