class CommandLineInterface

    def call
        # Scraper.scrape_character_class #testing
        # CharacterClass.list_classes #testing
        # CharacterClass.menu #testing
        puts "Welcome to the Pathfinder Character Generator!"
        puts "What would you like your Character's name to be:"
        input = gets.chomp
        player = CharacterSheet.new(input)
        puts "Your character's name is now #{player.name}"
        puts "You are building a level #{player.level} character" 
        puts "We're going to start with selecting a race. You will be able to change this at any time during the character creation process, so don't worry if you can't decide right away."
        puts "Please select a potential character race to learn more about them:"
        Scraper.scrape_race
        Scraper.scrape_character_class
        Race.list_races
        Race.menu
        main_menu
    end

    def main_menu
        puts "What would you like to do next?"
        puts "1. Learn more about potential character races."
        puts "2. Learn more about potential character classes." 
        puts "3. View your character sheet." if CharacterSheet.all[0].race && CharacterSheet.all[0].characterclass
        puts "4. Exit the character creater." 
        input = gets.chomp 
        if input.to_i == 1
            puts "You chose: Learn more about potential character races."
            Race.list_races
            Race.menu
            main_menu
        elsif input.to_i == 2
            puts "You chose: Learn more about potential character classes."
            CharacterClass.list_classes
            CharacterClass.menu
            main_menu
        elsif input.to_i == 3 && CharacterSheet.all[0].race && CharacterSheet.all[0].characterclass
            puts "You chose: View your character sheet."
            character = CharacterSheet.all[0]
            character.view
            main_menu
        elsif input.to_i == 4
            puts "You chose: Exit the character creator."
            exit        
        else
            puts "Whoops, I didn't catch that. Let's try again."
            main_menu
        end
    end
end