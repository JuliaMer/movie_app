class Movie < ApplicationRecord
  has_many :roles
  has_many :actors, :through => :roles
  has_many :showtimes, dependent: :destroy
  accepts_nested_attributes_for :showtimes, allow_destroy: true, reject_if: lambda {|a| a['cinema'].blank? || a['date'].blank?}
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :year, presence: true
  validates :youtube_trailer_url, format: {with: /\A((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?\z/}, allow_blank: true
  before_validation :remove_whitespace_user_input
  #validate :transform_url_to_embedded just if you want to correct the url all the time, if not better do the correction in the view

=begin

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

=end

  def ensure_youtube_url

   #if url.include? "youtube"
      #if url.include? "watch?v="
       # url.sub!("watch?v=", "embed/")
      #elsif !url.include? "embed/"
       # errors.add :url, "incomplete youtube link"
      #end
   #elsif url.blank?
     #url
    #else
      #errors.add :url, "no valid youtube link"
   #end

    if !url.include? "youtube"
      errors.add :youtube_trailer_url, "no valid youtube link"
    end

  end

  def remove_whitespace_user_input
    title.strip!
    year.strip!
    youtube_trailer_url.strip!
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

  def total_shows
    showtimes.size
    #Showtime.where(:movie_id => movie.id).size
  end

end

