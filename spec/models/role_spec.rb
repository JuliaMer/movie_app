require 'rails_helper'

RSpec.describe Role, type: :model do

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

end

#Relations fehlen, dh in role muss er als actor: keinen string bekommen, sondern eine Relation zu Actor
#no built in test associations like that. gem shoulda-matchers