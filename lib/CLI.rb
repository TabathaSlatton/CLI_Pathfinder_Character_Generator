class CommandLineInterface

    def call
        puts "Welcome to the Pathfinder Character Generator!"
        puts "Please select a character race to learn more about them:"
        Scraper.scrape_race
        Race.list_races
    end

end