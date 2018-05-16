Given("there are two roles in the list") do
  Role.create!(movie: Movie.create!(title: "Wizards", year: "2018"), actor: Actor.create!(name: "Max", birthday: "2000-10-5"), character: "Gandalf")
  Role.create!(movie: Movie.create!(title: "Witches", year: "2017"), actor: Actor.create!(name: "Moritz", birthday: "2000-04-15"), character: "Bibi Blocksberg")
end

Given("there is a add role link") do
  #page.find_link('add role')
  expect(page).to have_link('add role', href: new_role_path)
end

Then(/it should redirect to the movies show for "(.*)"/) do |title|
  expect(page.current_path).to eq(movie_path(Movie.find_by_title(title)))
end
Then(/it should redirect to the roles show for "(.*)"/) do |character|
  expect(page.current_path).to eq(role_path(Role.find_by_character(character)))
end

Given("there is a edit link for every role") do
  Role.all.each do |role|
    expect(page).to have_link('edit', href: edit_role_path(role))
  end
end

When(/I click on edit for role "(.*)"/) do |character|
  row = page.find("tr", text: character)
  row.click_link('edit')
end

Then(/it should redirect to the roles edit for "(.*)"/) do |character|
  expect(page.current_path).to eq(edit_role_path(Role.find_by_character(character)))

end



Given("there is a delete link for every role") do
  table = page.find("table")
  rows = table.all("tr").count
  expect(Role.all.count).to eq(rows)
end


When(/I click on delete for role "(.*)"/) do |character|
  row = page.find("tr", text: character)
  row.click_link('delete')
end

