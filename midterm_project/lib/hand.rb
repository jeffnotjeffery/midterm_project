class Hand
    attr_reader :cards

    HAND_STRENGTHS = {
        high_card: 0,
        pair: 1,
        two_pairs: 2,
        three_of_a_kind: 3,
        straight: 4,
        flush: 5,
        full_house: 6,
        four_of_a_kind: 7,
        straight_flush: 8
    }

    def initialize(cards)
        @cards = cards
    end

    def hand_strength
        if straight_flush?
            :straight_flush
        elsif four_of_a_kind?
            :four_of_a_kind
          elsif full_house?
            :full_house
          elsif flush?
            :flush
          elsif straight?
            :straight
          elsif three_of_a_kind?
            :three_of_a_kind
          elsif two_pairs?
            :two_pairs
          elsif pair?
            :pair
          else
            :high_card
          end
        end

private

def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    cards.group_by(&:value).any? { |_, group| group.length == 4 }
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    cards.map(&:suit).uniq.length == 1
  end

  def straight?
    values = cards.map(&:value).sort
    (values.last - values.first) == 4 && values.uniq.length == 5
  end

  def three_of_a_kind?
    cards.group_by(&:value).any? { |_, group| group.length == 3 }
  end

  def two_pairs?
    cards.group_by(&:value).count { |_, group| group.length == 2 } == 2
  end

  def pair?
    cards.group_by(&:value).any? { |_, group| group.length == 2 }
  end
end

