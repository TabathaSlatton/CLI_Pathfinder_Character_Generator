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
end

