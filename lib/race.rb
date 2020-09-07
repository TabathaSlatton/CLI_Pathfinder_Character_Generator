class Race
    attr_accessor :name, :url

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
         puts "Race information here"
        end
        puts "Please choose from the following options:"
        puts "1. Assign race to your character sheet."
        puts "2. Learn information about another race."
        puts "3. Go back to main menu to choose another character creator option."
        puts "4. Exit the character creator."
        input = gets.chomp
        if input.to_i == 1
            puts "You chose to: Assign race to your character sheet."
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