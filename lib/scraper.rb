require 'pry'
require 'nokogiri'
require 'open-uri'
class Scraper

    RACE_URL =
    RACE_DETAILS_URL = "https://2e.aonprd.com/Ancestries.aspx"
    CHARACTER_CLASS_URL = 
    CHARACTER_CLASS_DETAILS_URL =

    def self.scrape_race(race_url = RACE_URL)
        doc = Nokogiri::HTML(open(race_url))
        # scraped_character_races = []
        char_classes = doc.css('div.main span')[3].css('h2 a')
        char_classes.each do |character_class|
            binding.pry
            # scraped_character_races << 
            if character_class.text != ""
                race = character_class.text.strip
                url = character_class['href']

                Race.new(race, url)
            end
        end
    end

    def self.scrape_race_details(race_details_url = RACE_DETAILS_URL)
        doc = Nokogiri::HTML(open(race_details_url))
        doc.css("")
    end

    def self.scrape_character_class(character_class_url = CHARACTER_CLASS_URL)
        doc = Nokogiri::HTML(open(character_class_url))
        
    end

    def self.scrape_character_class_details(character_class_details_url = CHARACTER_CLASS_DETAILS_URL)
        doc = Nokogiri::HTML(open(character_class_details_url))
        doc.css("")
    end
end

Scraper.scrape_race