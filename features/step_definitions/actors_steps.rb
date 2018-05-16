Given("there are two actors in the list") do
  Actor.create!(name: "Max", birthday: "01.01.2018")
  Actor.create!(name: "Moritz", birthday: "01.01.2018")
end

When("I go to the actors index") do
  visit 'actors#index'
end

Then("I should see a list of all actors") do
  Actor.all.each do |actor|
    expect(page).to have_text(actor.name)
  end
end

Given("there is a add actor link") do
  expect(page).to have_link('add actor', href: new_actor_path)
end

When("I click on the add actor link") do
  click_link('add actor')
end

Then("it should redirect to the actors new page") do
  expect(page.current_path).to eq(new_actor_path)
end


Given("actor name is linked to the actors show") do
  Movie.all.each do |movie|
    expect(page).to have_link(movie.title, href: movie_path(movie))
  end
end

When(/I click on the actor name "(.*)"/) do |name|
  click_link(Actor.find_by_name(name).name)
end

Then(/it should redirect to actors show for "(.*)"/) do |name|
  expect(page.current_path).to eq(actor_path(Actor.find_by_name(name)))
end


Given("there is a edit link for every actor") do
  Actor.all.each do |actor|
    expect(page).to have_link('edit', href: edit_actor_path(actor))
  end
end

When(/I click on edit for actor "(.*)"/) do |name|
  row = page.find("tr", text: name)
  row.click_link('edit')
end

Then(/it should redirect to the actors edit for "(.*)"/) do |name|
  expect(page.current_path).to eq(edit_actor_path(Actor.find_by_name(name)))
end


Given("there is a delete link for every actor") do
  table = page.find("table")
  rows = table.all("tr").count
  expect(Actor.all.count).to eq(rows)
end

When(/I click on delete for actor "(.*)"/) do |name|
  row = page.find("tr", text: name)
  row.click_link('delete')
end

Then("it should redirect to the actors index") do
  expect(page.current_path).to eq(actors_path)
end

Then(/there should be no actor "(.*)"/) do |name|
  expect(page).to_not have_text(name)
end

