require_relative '../lib/hand'

RSpec.describe Hand do
    describe "#initialize" do
        it "creates a hand with specific cards" do
            cards = [Card.new("Clubs", "King"), Card.new("Hearts", "Ace")]
            hand = Hand.new(cards)
            expect(hand.cards).to eq(cards)
        end
    end
end

    