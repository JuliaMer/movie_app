class Movie < ApplicationRecord
  has_many :roles
  has_many :actors, :through => :actor_movies
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :year, presence: true
  validates :url, format: {with: /((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?/}, allow_blank: true

  def find_genre
    if genre.blank?
      @genre = "No genre added"
    else
      self.genre
    end
  end

  def find_url
    if url.blank?
      @url = "No trailer added"
      return false
    else
      self.url
    end
  end

end
