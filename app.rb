require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
Enzo = HumanPlayer.new("Enzo")

#while player1.life_points > 0 && player2.life_points > 0
#    puts ""
#    puts "Voici l'état de chaque joueur:"
#    print player1.show_state
#    puts player2.show_state
#    puts "Passons à la phase d'attaque"
#    player2.attack(player1)
#    break if player1.life_points <= 0
#    player1.attack(player2)
#end

binding.pry