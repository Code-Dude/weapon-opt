require_relative "spec_helper"

describe "A weapon" do
  it "has a set of attributes" do
    # Attributes are (category, name, damage, threat, crit_mod, type, special)
    @test_weap = Weapon.new("simple","Dagger", 4, 2,  2, "P&S","N/A")

    expect(@test_weap.category).to eq("simple")
  end
end