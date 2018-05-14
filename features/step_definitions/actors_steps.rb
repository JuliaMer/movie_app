Given("there are two actors in the list") do
  Actor.create!(name: "Witches", birthday: "01.01.2018")
  Actor.create!(name: "Wizards", birthday: "01.01.2018")
end

When("I go to the actors index") do
  visit 'actors#index'
end

Then("I should see a list of all actors") do
  Actor.all.each do |actor|
    expect(page).to have_text(actor.name)
  end
end

When("I click on the add actor button") do
  expect(page).to have_link('add actor', href: new_actor_path)
end

Then("I go to the actors new page") do
  visit 'actors#new'
end

