require_relative '../lib/game'

RSpec.describe Game do
  describe "#initialize" do
    it "creates a game with a deck and players" do
      # Create a test double for the Deck class
      deck_double = instance_double("Deck")
      
      # Specify that the deck double should respond to the cards method
      allow(deck_double).to receive(:cards).and_return([])
      
      # Create test doubles for the Player class
      players = [instance_double("Player"), instance_double("Player")]

      # Pass the deck double and players to the Game constructor
      game = Game.new(deck_double, players)

      # Assert that the game's deck matches the deck double
      expect(game.deck).to eq(deck_double)
      # Assert that the game's players match the players array
      expect(game.players).to eq(players)
    end
  end
end
