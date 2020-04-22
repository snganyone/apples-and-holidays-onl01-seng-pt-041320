require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
   #holiday_supplies = {
    # :winter => {
    #   :christmas => ["Lights", "Wreath"],
    #   :new_years => ["Party Hats"]
     #},
     #:summer => {
    #   :fourth_of_july => ["Fireworks", "BBQ"]
    # },
     #:fall => {
      # :thanksgiving => ["Turkey"]
     #},
     #:spring => {
    #   :memorial_day => ["BBQ"]
    # }
   #}
   #return the second element in the 4th of July array
   holiday_hash.each do |attribute, value|
     value.each do |event, data|
       if event == :fourth_of_july
         return "#{data[1]}"
       end
     end
   end

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  #holiday_supplies = {
   # :winter => {
   #   :christmas => ["Lights", "Wreath"],
   #   :new_years => ["Party Hats"]
    #},
    #:summer => {
   #   :fourth_of_july => ["Fireworks", "BBQ"]
   # },
    #:fall => {
     # :thanksgiving => ["Turkey"]
    #},
    #:spring => {
   #   :memorial_day => ["BBQ"]
   # }
  #}
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |attribute, value|
      if attribute == :winter
        value.each do |event, data|
          data << supply
        end
      end
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |attribute, value|
      if attribute == :spring
        value.each do |event, data|
          data << supply
        end
      end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  new_hash = {season => {holiday_name => supply_array}}
  holiday_hash.merge!(new_hash)
  return holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_arr = []
  holiday_hash.each do |attribute, value|
      if attribute == :winter
        value.each do |event, data|
          new_arr.push(data)
        end
      end
    end
    return new_arr.join(", ")
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, season_hash|
    puts "#{season.capitalize()}:"
    season_hash.each do |holidays, supplies|
      puts "  #{holidays.to_s.split("_").map(&:capitalize).join(" ")}: #{supplies.join(", ")}"
    end
  end
end


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.each do |seasons, season_hash|
    season_hash.each do |holidays, supplies|
      supplies.each{|i| puts "#{holidays}" if i == "BBQ" }
    end
  end
end
