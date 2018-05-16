Given("there are two roles in the list") do
  Role.create!(movie: Movie.create!(title: "Wizards", year: "2018"), actor: Actor.create!(name: "Max", birthday: "2000-10-5"), character: "Gandalf")
  Role.create!(movie: Movie.create!(title: "Witches", year: "2017"), actor: Actor.create!(name: "Moritz", birthday: "2000-04-15"), character: "Bibi Blocksberg")
end

