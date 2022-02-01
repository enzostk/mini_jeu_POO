require 'bundler'
Bundler.require

require_relative 'lib/game'                 # Lie aux fichiers du dossier lib 
require_relative 'lib/player'
# <----------------------------  Début de partie  ---------------------------------->
puts "--------------------------------------------------------"
puts "|                                                      |"
puts "|       Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|     Le but du jeu est d'être le dernier survivant !  |"
puts "|                                                      |"
puts "--------------------------------------------------------"

puts "Quel est le prénom de votre combattant:"
print "> "
user = gets.chomp
user = HumanPlayer.new(user)
Ennemy = [player1 = Player.new("Josiane"),player2 = Player.new("José")]     #Crée 2 player de classe Player dans un array

# <----------------------------      FIGHT    ------------------------------------->
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    
    puts ""
    puts "Voici l'état de votre personnage:"
    puts user.show_state 
    puts ""
    puts "Quel action veutx-tu effectuer :"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts ""
    puts "Attaquer un joueur en vue :"
    print "0 - "
    puts "#{player1.show_state}"
    print "1 - "
    puts "#{player2.show_state}"
    print "> "
    
    choice = gets.chomp
    case choice
        when "a"
            user.search_weapon
        when "s"
            user.search_health_pack
        when "0"
            user.attack(player1)
        when "1"
            user.attack(player2)
    end
    puts ""
    
    puts "Les ennemies attaquent:"
    Ennemy.each do |player|
        if player.life_points > 0
           player.attack(user)
        else
            puts"#{player.name} ne peut pas attaquer."
        end
    end
end

# <---------------------------   Fin de partie   ------------------------------------->
    puts "La partie est fini !"

    if user.life_points == 0
        puts "Dommage, J&J t'ont balayé sans respect."
    else 
        puts "Bravo! Tu leur as mis une sacrée branlée!"
    end
