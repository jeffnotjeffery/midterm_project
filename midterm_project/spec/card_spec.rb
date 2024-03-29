require_relative '../lib/card'


RSpec.describe Card do
    describe "#initialize" do
        it "makes a card with a suit and value" do
            card = Card.new("Hearts", "Ace")
            expect(card.suit).to eq("Hearts")
            expect(card.value).to eq("Ace")
        end
    end

    describe "#to_string" do
        it "returns the string form of the card" do
            card = Card.new("Spades", "8")
            expect(card.to_string).to eq("8 of Spades")
        end
    end

end 

