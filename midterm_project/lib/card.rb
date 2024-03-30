class Card
    SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]
    VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    attr_reader :suit, :value

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

    def to_string
        "#{value} of #{suit}"
    end
end
