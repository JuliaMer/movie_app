class Movie < ApplicationRecord
  has_many :roles
  has_many :actors, :through => :actor_movies
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :year, presence: true
  validates :url, format: {with: /((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?/}, allow_blank: true

  def find_genre
    if genre.blank?
      "No genre added"
    else
      genre
    end
  end

  def find_url
    if url.blank?
      "No trailer added"
    else
      url
    end
  end

end
