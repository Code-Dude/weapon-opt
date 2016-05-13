require_relative "weapon_mods"

class Optimizer

  def initialize
    @RANGED_WEAPONS_STR = [
        :Shuriken,
        :Sling,
        :HalflingSlingStaff,
        :Kestros,
        :Javelin,
        :Dart,
        :Chakram,
        :Atlatl,
        :Boomerang,
        :CompLongbow,
        :CompShortbow,
    ]
  end

  def optimize_light_ratings
    opt_weaps_ratings = Hash.new
    WeaponMods::LIGHT_WEAPONS.each do |k,v|
      opt_rank = v[2] * v[3] * v[4]
      opt_weaps_ratings[k] = opt_rank
    end
    sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
    File.open('Weapon_Optimized_Results.txt', 'w') do |fh|
      fh.puts "-----LIGHT WEAPONS WITH RATINGS-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
      WeaponMods::LIGHT_WEAPONS.each do |k,v|
        opt_rank = (v[2] + 3) * v[4]
        opt_weaps_ratings[k] = opt_rank
      end
      sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
      fh.puts "\n-----LIGHT WEAPONS MAX DAMAGE-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
    end
  end

  def optimize_one_handers
    opt_weaps_ratings = Hash.new
    WeaponMods::ONE_HANDERS.each do |k,v|
      opt_rank = v[2] * v[3] * v[4]
      opt_weaps_ratings[k] = opt_rank
    end
    sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
    File.open('Weapon_Optimized_Results.txt', 'a') do |fh|
      fh.puts "\n-----ONE HANDERS WITH RATINGS-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
      WeaponMods::ONE_HANDERS.each do |k,v|
        opt_rank = (v[2] + 3 ) * v[4]
        opt_weaps_ratings[k] = opt_rank
      end
      sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
      fh.puts "\n-----ONE HANDERS MAX DAMAGE-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
    end
  end

  def optimize_two_handers
    opt_weaps_ratings = Hash.new
    WeaponMods::TWO_HANDERS.each do |k,v|
      opt_rank = v[2] * v[3] * v[4]
      opt_weaps_ratings[k] = opt_rank
    end
    sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
    File.open('Weapon_Optimized_Results.txt', 'a') do |fh|
      fh.puts "\n-----TWO HANDERS WITH RATINGS-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
      WeaponMods::TWO_HANDERS.each do |k,v|
        opt_rank = (v[2] + (3 * 1.5).to_i) * v[4]
        opt_weaps_ratings[k] = opt_rank
      end
      sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
      fh.puts "\n-----TWO HANDERS MAX DAMAGE-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
    end
  end

  def optimize_ranged_weapons
    opt_weaps_ratings = Hash.new
    WeaponMods::RANGED_WEAPONS.each do |k,v|
      opt_rank = v[2] * v[3] * v[4]
      opt_weaps_ratings[k] = opt_rank
    end
    sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
    File.open('Weapon_Optimized_Results.txt', 'a') do |fh|
      fh.puts "\n-----RANGED WEAPONS WITH RATINGS-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
      WeaponMods::RANGED_WEAPONS.each do |k,v|
        if @RANGED_WEAPONS_STR.include?(k)
          opt_rank = (v[2] + 3 ) * v[4]
          opt_weaps_ratings[k] = opt_rank
        elsif k == :DoubleCrossbow
          opt_rank = ((v[2]) * v[4]) + v[2]
          opt_weaps_ratings[k] = opt_rank
        else
          opt_rank = v[2] * v[4]
          opt_weaps_ratings[k] = opt_rank
        end
      end
      sorted_weaps = opt_weaps_ratings.sort_by {|k,v| v}
      fh.puts "\n-----RANGE WEAPONS MAX DAMAGE-----"
      sorted_weaps.reverse.each {|k,v| fh.puts "#{k} => #{v}"}
    end
  end

  def self.optimize
      opt = Optimizer.new
      opt.optimize_light_ratings
      opt.optimize_one_handers
      opt.optimize_two_handers
      opt.optimize_ranged_weapons
  end
end

Optimizer.optimize