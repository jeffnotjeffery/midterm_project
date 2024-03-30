class Player
    attr_accessor :hand, :pot, :name

    def initialize(hand,pot, name)
        @hand = hand
        @pot = pot
        @name = name
    end

    def to_s
        "Player's Hand: #{hand}"
    end
end
