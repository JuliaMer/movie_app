module MoviesHelper

  def transfrom_youtube_trailer_url_to_embedded(movie)
    if movie.youtube_trailer_url.include? "watch?v="
      movie.youtube_trailer_url.sub("watch?v=", "embed/")
    else
      movie.youtube_trailer_url
    end
  end

  def trailer(movie)
    if movie.youtube_trailer_url.blank?
      "no Trailer added"
    else
      render partial: 'movies/trailer', locals: {:embedded_youtube_url => transfrom_youtube_trailer_url_to_embedded(movie)}

      #'<iframe width="560" height="315" src="https://www.youtube.com/embed/Jer8XjMrUB4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'.html_safe
      # '<iframe width="560" height="315" src='.html_safe + movie.url + ' frameborder="0" allow="autoplay; encrypted-media" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'.html_safe
    end
  end


  def find_genre(movie)
    if movie.genre.blank?
      "no genre added"
    else
      movie.genre
    end
  end

end


=begin
class String

  def +(other_string)
    concat(other_string)
  end

  def html_safe
    SafeBuffer.new(self)
  end

end

class SafeBuffer

  def +(other_string)
    if other_string.is_a?(SafeBuffer)
      concat(other_string)
    else
      concat(html_escape(other_string))
    end
  end

  def html_safe
    self
  end

end

=end