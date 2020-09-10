class Race
    attr_accessor :name, :url, :you_might, :others_probably, :physical_description, :society, :alignment, :alignment_and_religion, :adventurers, :names, :sample_names, :hit_points, :size, :speed, :ability_boosts, :ability_flaw, :languages, :low_light_vision, :darkvision, :clan_dagger, :keen_eyes, :land_on_your_feet, :draconic_exemplar, :plant_nourishment, :aquatic_adaptation, :claws, :blunt_snout, :sharp_beak

    @@all = []
    def initialize(name, url)
        self.name = name
        self.url = url
        @@all << self
    end

    def self.list_races
        self.all.each.with_index(1) do |race, i|
            puts "#{i}. #{race.name}"
        end
        # binding.pry
    end

    def self.all
        @@all
    end

    def self.menu
        puts "Please select a number to get more information about the character race:"
        input = gets.chomp
        if !input.to_i.between?(1, Race.all.length)
            puts "Sorry, I didn't catch that. Let's try again."
            list_races
            menu
        else
          race = Race.all[input.to_i-1]
          Scraper.scrape_race_details(race)
        end
        puts "Please choose from the following options:"
        puts "1. Assign race to your character sheet."
        puts "2. Learn information about another race."
        puts "3. Go back to main menu to choose another character creator option."
        puts "4. Exit the character creator."
        input = gets.chomp
        if input.to_i == 1
            puts "You chose to: Assign race to your character sheet."
            character = CharacterSheet.all[0]
            character.assign_race(Race.all[input.to_i-1])
            puts "#{character.name}'s race is now: #{character.race_name}"
        elsif input.to_i == 2
            puts "You chose to: Learn information about another race."
            list_races
            menu
        elsif input.to_i == 3
            puts "You chose to: Go back to main menu to choose another character creator option."
        elsif input.to_i == 4
            puts "You chose to: Exit the character creator."
            exit
        else 
            puts "Sorry, I didn't catch that. Let's look at more races:"
            list_races
            menu
        end
    end
end