require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/hand'
require_relative '../lib/player'
require_relative '../lib/game'

# create a deck and shuffle it
deck = Deck.new
deck.shuffle

#creates hands for each player
hand_size = 5
player1_hand = Hand.new(deck.deal(hand_size))
player2_hand = Hand.new(deck.deal(hand_size))

#set the pot
pot = 100
# creates players with hands and pot
player1 = Player.new(player1_hand, pot, "Player 1  ")
player2 = Player.new(player2_hand,pot, "Player 2 ")
#player array
players = [player1, player2]
#create game w players
game = Game.new(deck, players)
#deal cards
game.deal_cards
#show results
game.start_round