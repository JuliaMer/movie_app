class Movie < ApplicationRecord
  has_many :roles
  has_many :actors, :through => :roles
  has_many :showtimes, dependent: :destroy
  accepts_nested_attributes_for :showtimes, allow_destroy: true, reject_if: lambda {|a| a['cinema'].blank? || a['date'].blank?}
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :year, presence: true, length: {is: 4, message: "must be four digits."}
  validates :youtube_trailer_url, format: {with: /\A(https:\/\/www\.youtube\.com\/)(watch\?v=|embed\/)[a-zA-Z0-9]+\z/, message: "is not correct. Ensure entering a complete youtube address."}, allow_blank: true
  before_validation :strip_whitespace_user_input
  #validate :transform_url_to_embedded just if you want to correct the url all the time, if not better do the correction in the view

  def strip_whitespace_user_input
    unless title.nil?
      title.strip!
    end
    unless youtube_trailer_url.nil?
      youtube_trailer_url.strip!
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

  def total_shows
    showtimes.size
    #Showtime.where(:movie_id => movie.id).size
  end

end

