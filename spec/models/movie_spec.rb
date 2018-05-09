require 'rails_helper'

RSpec.describe Movie, type: :model do

  it "is valid with a title, year, genre and youtube trailer url" do
    movie = Movie.new(
        title: "Werner",
        year: "1998",
        genre: "Action",
        youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8"
    )
    expect(movie).to be_valid
  end

  it "is invalid without a title" do
    movie = Movie.new(title: nil)
    movie.valid?
    expect(movie.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a year" do
    movie = Movie.new(year: nil)
    movie.valid?
    expect(movie.errors[:year]).to include("must be four digits.")
  end

  it "is invalid with a duplicate title" do
    Movie.create(
        title: "Werner",
        year: "1998",
        genre: "Action",
        youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8",
        )
    movie = Movie.new(
        title: "Werner",
        year: "1998",
        genre: "Action",
        youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8",
    )
    movie.valid?
    expect(movie.errors[:title]).to include("has already been taken")
  end

end
