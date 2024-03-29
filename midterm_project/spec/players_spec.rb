require_relative '../lib/player'

RSpec.describe Player do
    describe "#initialize" do
        it "creates a player with a hand and a pot" do
            hand = instance_double("Hand")
            pot = 100
            player = Player.new(hand, pot)
            expect(player.hand).to eq(hand)
            expect(player.pot).to eq(pot)
        end
    end
end 
