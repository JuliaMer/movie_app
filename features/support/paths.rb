
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.feature
  #
  def path_to(page_name)
    case page_name

      when /^the home\s?page$/
        root_path
      when /^the roles index/
        roles_path
      when /^the roles new page/
        roles_new_path
      when /^the roles show for "(.*)"/
        role = Role.find_by_character($1)
        role_path(role)
      when /^the roles edit for "(.*)"/
        role = Role.find_by_character($1)
        edit_role_path(role)
      when /^the movies index/
        movies_path
      when /^the movies show for "(.*)"/
        movie = Movie.find_by_title($1)
        movie_path(movie)
      when /^the movies edit for "(.*)"/
        movie = Movie.find_by_title($1)
        edit_movie_path(movie)
      when /^the actors show for "(.*)"/
        actor = Actor.find_by_name($1)
        actor_path(actor)
      when /^the actors index/
        actors_path
      when /^the actors edit for "(.*)"/
        actor = Actor.find_by_name($1)
        edit_actor_path(actor)
      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)
