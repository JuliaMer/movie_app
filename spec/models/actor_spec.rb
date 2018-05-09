require 'rails_helper'

RSpec.describe Actor, type: :model do
  it "is valid with a name and birthday" do
    actor = Actor.new(
                     name: "Sabrina",
                     birthday: "1998-04-10"
    )
    expect(actor).to be_valid
  end

  it "is invalid without a name" do
    actor = Actor.new(name: nil)
    actor.valid?
    expect(actor.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a birthday" do
   actor = Actor.new(birthday: nil)
    actor.valid?
    expect(actor.errors[:birthday]).to include("can't be blank")
  end

  it "is invalid with a duplicate title" do
    Actor.create(
        name: "Sabrina",
        birthday: "1998-04-10"
        )
    actor = Actor.new(
        name: "Sabrina",
        birthday: "1998-04-10"
        )
    actor.valid?
    expect(actor.errors[:name]).to include("has already been taken")
  end


end
