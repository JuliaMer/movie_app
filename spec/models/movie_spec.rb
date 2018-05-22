require 'rails_helper'

RSpec.describe Movie, type: :model do

  it "is valid with a title, year, genre and youtube trailer url" do
    movie = Movie.new(
        title: "Witches",
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

  it "year is invalid with more than four digits" do
    movie = Movie.new(year: "20005")
    movie.valid?
    expect(movie.errors[:year]).to include("must be four digits.")
  end

  it "is invalid with a duplicate title" do
    Movie.create(
        title: "Witches",
        year: "1998",
        genre: "Action",
        youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8",
        )
    movie = Movie.new(
        title: "Witches",
        year: "1998",
        genre: "Action",
        youtube_trailer_url: "https://www.youtube.com/watch?v=vKQi3bBA1i8",
    )
    movie.valid?
    expect(movie.errors[:title]).to include("has already been taken")
  end

  it "is not case sensitive in title" do
    Movie.create!(title: "Witches", year: "2018")
    movie = Movie.new(title: "witches", year: "2005")
    movie.valid?
    expect(movie.errors[:title]).to include("has already been taken")
  end

  it "returns matching title for the search term" do
    first_movie = Movie.create!(title: "Witches", year: "2018")
    second_movie = Movie.create!(title: "Wizards", year: "2005")
    third_movie = Movie.create!(title: "Dwarfs", year: "2017")

    expect(Movie.search("wi")).to include(first_movie, second_movie)
    expect(Movie.search("wi")).to_not include(third_movie)
  end

  it "strips user input" do
    movie = Movie.create!(title: " Witches ", year: "2018")
    expect(movie.title).to eq("Witches")
  end

  it "is deleting movie object" do
    movie = Movie.create!(title: " Witches ", year: "2018")
    expect(movie.delete).to respond_with("Movie was deleted!")
    #expect(flash[:success]).to eq("Movie was deleted!")
  end
  
end
