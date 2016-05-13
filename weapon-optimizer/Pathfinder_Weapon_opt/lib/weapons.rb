class Weapon
  attr_accessor :category, :name, :price, :dmg, :threat, :crit_mod, :type, :special

  def initialize(category, name, dmg, threat, crit_mod, type, special)
    @category = category
    @name = name
    @dmg = dmg
    @threat = threat
    @crit_mod = crit_mod
    @type = type
    @special = special
  end
end