class CharacterSheet
    attr_accessor :name, :race, :characterclass, :level, :characterclass

    @@all = []

    def initialize(name)
        @name = name
        @level = 1
        @@all << self
    end

    def assign_race(race)
        @race = race
    end

    def self.all
        @@all
    end

    def race_name
        self.race.name
    end

    def assign_class(characterclass)
        @characterclass = characterclass
    end

    def class_name
        self.characterclass.name
    end

    def view
        puts "Character Name: #{@name}"
        puts "Character Race: #{@race.name}" unless @race == nil
        puts "Character Class: #{@characterclass.name}" unless @characterclass == nil
        puts "Character Level: #{self.level}"
        menu
    end

    def menu 
        puts "What else would you like to see?"
        puts "1. Details about your #{@race.name} race." unless @race == nil
        puts "2. Details about your #{@characterclass.name} class." unless @characterclass == nil
        puts "3. Nothing, back to main menu."
        puts "4. Nothing, exit character generator."
        input = gets.chomp
        if input.to_i == 1
            puts "You chose to: Get details about the #{@race.name} race."
            @race.details
            menu
        elsif input.to_i == 2
            puts "You chose to: Learn information about the #{@characterclass.name}class."
            @characterclass.details
            menu
        elsif input.to_i == 3
            puts "You chose to: Go back to main menu to choose another character creator option."
        elsif input.to_i == 4
            puts "You chose to: Exit the character creator."
            exit
        else 
            puts "Sorry, I didn't catch that. Let's check out your character sheet:"
            view
            menu
        end

    end
end

