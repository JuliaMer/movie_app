require 'rails_helper'

RSpec.describe Role, type: :model do
  it "is valid with an actor, movie and character" do
    role = Role.new(
        actor: "Sabrina",
        movie: "Werner",
        character: "Held",
        )
    expect(role).to be_valid

  end

  it "is invalid without an actor" do
    role = Role.new(actor: nil)
    role.valid?
    expect(role.errors[:actor]).to include("must exist")
  end

  it "is invalid without an movie" do
    role = Role.new(movie: nil)
    role.valid?
    expect(role.errors[:movie]).to include("must exist")
  end

  it "is invalid without an character" do
    role = Role.new(character: nil)
    role.valid?
    expect(role.errors[:character]).to include("can't be blank")
  end

  it "is invalid with a duplicate character in one movie" do

    movie = Movie.new(
        title: "Werner",
        year: "1998",
        genre: "Action",
        youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8"
    )

    movie.roles.build(
        character: "Held"
    )

    new_character = movie.roles.build(
        character: "Held"
    )

    new_character.valid?
    expect(new_character.errors[:character]).to include("")
  end

end

#Relations fehlen, dh in role muss er als actor: keinen string bekommen, sondern eine Relation zu Actor