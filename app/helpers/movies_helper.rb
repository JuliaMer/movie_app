module MoviesHelper

  def trailer(movie)
    if movie.url.blank?
      "No Trailer added"
    else
      render partial:'layouts/trailer', locals: {:movie => movie}
      # '<iframe width="560" height="315" src="https://www.youtube.com/embed/Jer8XjMrUB4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'.html_safe

      # '<iframe width="560" height="315" src='.html_safe + movie.url + ' frameborder="0" allow="autoplay; encrypted-media" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'.html_safe

    end
  end

end


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
