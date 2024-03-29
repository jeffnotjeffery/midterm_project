require_relative '../lib/deck'

RSpec.describe Deck do 
    describe "#initialize" do
        it "creates a deck with 52 cards" do
            deck = Deck.new
            expect(deck.cards.length).to eq(52)
        end
    end

    describe "#shuffle" do
        it "shuffles the deck" do
            deck = Deck.new
            original = deck.cards.dup
            deck.shuffle
            expect(deck.cards).not_to eq(original)
        end
    end

    describe "#deal" do
        it "Deals a certain nuber of cards from the deck" do
            deck = Deck.new
            cards = deck.deal(5)
            expect(cards.length).to eq(5)
            expect(deck.cards.length).to eq(47)
        end
    end
end