class Deck 
    attr_reader :cards

    SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]
    VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
  
    def initialize
      @cards = []
      SUITS.each do |suit|
        VALUES.each do |value|
          @cards << Card.new(suit, value)
        end
      end
    end
  
    def shuffle
      @cards.shuffle!
    end
  
    def deal(num)
      @cards.pop(num)
    end
  end