class Movie < ApplicationRecord
  has_many :roles
  has_many :actors, :through => :roles
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :year, presence: true
  validates :url, format: {with: /\A((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?\z/}, allow_blank: true

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

  #def youtube_embed_iframe_html
  #  '...'.html_safe
  #end

  def self.delete(movie, roles)
    movie.destroy
    roles.each do |role|
      role.destroy
    end
  end

end
