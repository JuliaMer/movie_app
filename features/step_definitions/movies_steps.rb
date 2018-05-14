Given("there are two movies in the list") do
  Movie.create!(title: "Witches", year: "2018", genre: "Action", youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8")
  Movie.create!(title: "Wizards", year: "2018", genre: "Action", youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8")
end

When("I go to the movies index") do
  visit 'movies#index'
end

Then("I should see a list of all movies") do
  Movie.all.each do |movie|
    expect(page).to have_text(movie.title)
  end
end


When("I click on the add movie button") do
  expect(page).to have_link('add movie', href: new_movie_path)
end

Then("I go to the movies new page") do
  visit 'movies#new'
end

Given("movie title is linked to movies show") do
  Movie.all.each do |movie|
    expect(page).to have_link(movie.title, href: movie_path(movie))
  end
end

Then("I click on the movie title") do

end

Then("I go to the movies show") do
  visit 'movies#show'
end

When("I click on edit") do
  Movie.all.each do |movie|
    expect(page).to have_link('edit', href: edit_movie_path(movie))
  end
end

Then("I go to the actors edit") do
  visit 'movies#edit'
end

When("I click on delete") do

end

