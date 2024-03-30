class Card
    attr_reader :suit, :value

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

    def to_string
        "#{value} of #{suit}"
    end
end
