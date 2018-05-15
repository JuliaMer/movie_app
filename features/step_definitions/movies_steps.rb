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


Given("there is a add movie button") do
  expect(page).to have_link('add movie', href: new_movie_path)
end

When("I click on the add movie button") do
  click_link('add movie')
end

Then("it should redirect to movies new page") do
  expect(page.current_path).to eq(new_movie_path)
end


Given("movie title is linked to movies show") do
  Movie.all.each do |movie|
    expect(page).to have_link(movie.title, href: movie_path(movie))
  end
end

When(/I click on the movie title "(.*)"/) do |title|
  click_link(Movie.find_by_title(title).title)
end

Then(/it should redirect to movies show for "(.*)"/) do |title|
  expect(page.current_path).to eq(movie_path(Movie.find_by_title(title)))
end


Given("there is a edit link for every movie") do
  Movie.all.each do |movie|
    expect(page).to have_link('edit', href: edit_movie_path(movie))
  end
end

When(/I click on edit for movie "(.*)"/) do |title|
  row = page.find("tr", text: title)
  row.click_link('edit')
end

Then(/it should redirect to movies edit for "(.*)"/) do |title|
  expect(page.current_path).to eq(edit_movie_path(Movie.find_by_title(title)))
end


Given("there is a delete link for every movie") do
  table = page.find("table")
  rows = table.all("tr").count
  expect(Movie.all.count).to eq(rows)
end

When(/I click on delete for movie "(.*)"/) do |title|
  row = page.find("tr", text: title)
  row.click_link('delete')
end

Then("it should redirect to movies index") do
  expect(page.current_path).to eq(movies_path)
end

Then(/there should be no movie title "(.*)"/) do |title|
  expect(page).to_not have_text(title)
end

