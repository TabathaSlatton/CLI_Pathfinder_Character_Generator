class CommandLineInterface

    def call
        puts "Welcome to the Pathfinder Character Generator!"
        puts "What would you like your Character's name to be:"
        input = gets.chomp
        player = CharacterSheet.new(input)
        puts "Your character's name is now #{player.name}"
        puts "You are building a level #{player.level} character" 
        puts "We're going to start with selecting a race. You will be able to change this at any time during the character creation process, so don't worry if you can't decide right away."
        puts "Please select a potential character race to learn more about them:"
        Scraper.scrape_race
        Race.list_races
        Race.menu
        main_menu
    end

    def main_menu
        puts "What would you like to do next?"
        puts "1. Learn more about potential character races."
        puts "2. Learn more about potential character classes."
        puts "3. Determine your ability scores."
        puts "4. Learn more about potential skills and feats."
        puts "5. Buy equipment."
        puts "6. Final Details."
        puts "7. View your character sheet."
        input = gets.chomp 
        if input.to_i == 1
            puts "You chose: Learn more about potential character races."
        elsif input.to_i == 2
            puts "You chose: Learn more about potential character classes."
        elsif input.to_i == 3
            puts "You chose: Determine your ability scores."
        elsif input.to_i == 4
            puts "You chose: Learn more about potential skills and feats."
        elsif input.to_i == 5
            puts "You chose: Buy equipment."
        elsif input.to_i == 6
            puts "You chose: Final Details."
        elsif input.to_i == 7
            puts "You chose: View your character sheet."
        else
            puts "Whoops, I didn't catch that. Let's try again."
            main_menu
        end
    end
end