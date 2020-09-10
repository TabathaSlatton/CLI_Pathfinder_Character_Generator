require 'pry'
require 'nokogiri'
require 'open-uri'
class Scraper

    RACE_URL = "https://2e.aonprd.com/Ancestries.aspx/"
    CHARACTER_CLASS_URL = "https://2e.aonprd.com/Classes.aspx/"

    def self.scrape_race(race_url = RACE_URL)
        doc = Nokogiri::HTML(open(race_url))
        # scraped_character_races = []
        char_classes = doc.css('div.main span')[3].css('h2 a')
        char_classes.each do |character_class|
            # binding.pry
            # scraped_character_races << 
            if character_class.text != ""
                race = character_class.text.strip
                url = character_class['href']
                Race.new(race, url) unless Race.all.any? {|obj| obj.name == race}
            end
        end
    end

    def self.scrape_race_details(race)
        # binding.pry
        doc = Nokogiri::HTML(open(RACE_URL+race.url))
        # binding.pry
        race_details = doc.css('h2.title')
        race_details.each do |heading|
            # binding.pry
            title = heading.text
            body = heading.next_sibling().text

            race.send(("#{title.downcase.split(/\.|\s|\(s\)|-/).join("_")}="), body)  unless title == "Names" || title == "Alignment and Religion"
            puts "#{heading.text}: \n   #{body}.\n\n" unless title == "Names" || title == "Alignment and Religion"
        end
    end

    def self.valid_class?(charclass)
        valid = true
        if CharacterClass.all.any? {|obj| obj.name == charclass}|| charclass == "Animal Companions" || charclass == "Familiar Abilities" || charclass == "Specific Familiars"
            valid = false
        end
        valid
    end

    def self.scrape_character_class(character_class_url = CHARACTER_CLASS_URL)
        doc = Nokogiri::HTML(open(character_class_url))
        char_classes = doc.css('h1 a')
        char_classes.each do |character_class|
            if character_class.text != ""
                charclass = character_class.text.strip
                url = character_class['href']
                CharacterClass.new(charclass, url) unless !valid_class?(charclass)
            end
        end   
    end

    def self.scrape_character_class_details(charclass)
        doc = Nokogiri::HTML(open(CHARACTER_CLASS_URL+charclass.url))
        # binding.pry
        class_details = doc.css('h2.title')
        class_details.each do |heading|
            # binding.pry
            title = heading.text
            body = heading.next_sibling().text

            charclass.traits(title, body)
            # charclass.send(("#{title.downcase.split(/\.|\s|\(s\)|-|'/).join("_")}="), body)  
            puts "#{heading.text}: \n   #{body}.\n\n" 
        end   
     end
end

