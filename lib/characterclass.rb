class CharacterClass
    attr_accessor :name, :url
    # attr_accessor :during_combat_encounters, :during_social_encounters, :while_exploring, :in_downtime, :you_might, :others_probably, :perception, :saving_throws, :skills, :attacks, :defenses, :class_dc, :alchemist_feats, :alchemy, :ancestry_and_background
    # attr_accessor :formula_book, :initial_proficiencies, :research_field, :skill_featslevel_2, :general_featslevel_3, :skill_increaseslevel_3, :ability_boostslevel_5, :ancestry_featslevel_5, :field_discoverylevel_5, :alchemical_weapon_expertiselevel_7, :iron_willlevel_7
    # attr_accessor :perpetual_infusionslevel_7, :alchemical_expertiselevel_9, :alertnesslevel_9, :double_brewlevel_9, :juggernautlevel_11, :perpetual_potencylevel_11, :greater_field_discoverylevel_13, :light_armor_expertiselevel_13, :weapon_specializationlevel_13
    # attr_accessor :alchemical_alacritylevel_15, :evasionlevel_15, :alchemical_masterylevel_17, :perpetual_perfectionlevel_17, :light_armor_masterylevel_19, :barbarian_feats, :instinct, :rage, :deny_advantagelevel_3, :brutalitylevel_5, :indomitable_willlevel_15
    # attr_accessor :juggernautlevel_7, :weapon_specializationlevel_7, :lightning_reflexeslevel_9, :raging_resistancelevel_9, :mighty_ragelevel_11, :greater_juggernautlevel_13, :medium_armor_expertiselevel_13, :weapon_furylevel_13, :greater_weapon_specializationlevel_15
    # attr_accessor :heightened_senseslevel_17, :quick_ragelevel_17, :armor_of_furylevel_19, :devastatorlevel_19, :spells, :composition_spells, :muses, :occult_spellcasting, :spell_repertoire, :bard_featslevel_2, :lightning_reflexeslevel_3, :signature_spellslevel_3
    # attr_accessor :expert_spellcasterlevel_7, :great_fortitudelevel_9, :resolvelevel_9, :bard_weapon_expertiselevel_11, :vigilant_senseslevel_11, :master_spellcasterlevel_15, :greater_resolvelevel_17, :legendary_spellcasterlevel_19, :magnum_opuslevel_19, :champion_feats
    # attr_accessor :champion_s_code, :champion_s_reaction, :deific_weapon, :deity_and_cause, :devotion_spells, :shield_block, :divine_allylevel_3, :weapon_expertiselevel_5, :armor_expertiselevel_7, :champion_expertiselevel_9, :divine_smitelevel_9, :juggernautlevel_9
    # attr_accessor :alertnesslevel_11, :divine_willlevel_11, :exaltlevel_11, :armor_masterylevel_13, :weapon_masterylevel_13, :champion_masterylevel_17, :legendary_armorlevel_17, :hero_s_defiancelevel_19, :deity, :divine_font, :divine_spellcasting, :doctrine

    @@all = []

    def initialize(charclass, url)
        @name = charclass
        @url = url
        @traits = {}
        @@all << self
    end
    
    def self.list_classes
        self.all.each.with_index(1) do |charclass, i|
            puts "#{i}. #{charclass.name}"
        end
    end

    def self.all
        @@all
    end

    def traits (trait, value)
        @traits[trait] = value
    end

    def traits_reader
        @traits
    end

    def self.menu
        puts "Please select a number to get more information about the character class:"
        input = gets.chomp
        if !input.to_i.between?(1, CharacterClass.all.length)
            puts "Sorry, I didn't catch that. Let's try again."
            list_classes
            menu
        else
          charclass = CharacterClass.all[input.to_i-1]
          Scraper.scrape_character_class_details(charclass)
        end
        puts "Please choose from the following options:"
        puts "1. Assign class to your character sheet."
        puts "2. Learn information about another class."
        puts "3. Go back to main menu to choose another character creator option."
        puts "4. Exit the character creator."
        new_input = gets.chomp
        if new_input.to_i == 1
            puts "You chose to: Assign class to your character sheet."
            character = CharacterSheet.all[0]
            character.assign_class(CharacterClass.all[input.to_i-1])
            puts "#{character.name}'s class is now: #{character.class_name}"
            CommandLineInterface.main_menu
        elsif new_input.to_i == 2
            puts "You chose to: Learn information about another class."
            list_classes
            menu
        elsif new_input.to_i == 3
            puts "You chose to: Go back to main menu to choose another character creator option."
            CommandLineInterface.main_menu
        elsif new_input.to_i == 4
            puts "You chose to: Exit the character creator."
            exit
        else 
            puts "Sorry, I didn't catch that. Let's look at more classes:"
            list_classes
            menu
        end
    end
end