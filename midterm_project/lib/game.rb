class Game
    attr_reader  :players, :deck, :pot

    def initialize(deck, players)
        @players = players
        @deck = deck
        @pot = 0
    end

    def start_round
        
        deal_cards

        betting_round
    
        players.each { |player| discard_and_draw(player) }

        betting_round

        determine_winner
    end
    
    def deal_cards
        players.each do |player|
            player.hand = Hand.new(deck.deal(5))
        end
    end

    def betting_round
        players.each do |player|
            puts "Player #{player.name}'s turn to bet"
            action, amount = get_player_action(player)
            case action
            when :fold
                puts "#{player.name} folds."
            
            when :see
                puts "#{player.name} sees."
                # Player sees, add to the pot
                @pot += amount
              when :raise
                puts "#{player.name} raises by #{amount}."
                # Player raises, deduct from their pot and add to the main pot
                player.pot -= amount
                @pot += amount
              end
            end
        end
        
    def discard_and_draw(player)
        puts "Player #{player.name}'s turn to discard and draw:"
        # logic for player to discard and draw cards
        puts "Your current hand: #{player.hand}"
        puts "Enter the indexes of the cards you want to discard (e.g., 1 3 5), or type 'none' to keep all cards:"
        discarded_indexes = gets.chomp.split.map(&:to_i)
        unless discarded_indexes.include?(0)
            player.hand.discard(discarded_indexes)
            num_cards_to_draw = discarded_indexes
            new_cards = deck.deal(num_cards_to_draw)
            player.hand.add_cards(new_cards)
            puts "You discarded cards #{discarded_indexes}, and drew #{num_cards_to_draw} new cards."
            puts "Your new hand: #{player.hand}"
    else
      puts "You chose not to discard any cards."
    end
end

def determine_winner
    puts "Determining winner..."
    winning_hand = players.max_by { |player| player.hand.hand_strength }
    winners = players.select { |player| player.hand.hand_strength == winning_hand.hand.hand_strength }
    if winners.length == 1
      puts "#{winning_hand.name} wins with #{winning_hand.hand.hand_strength}!"
    else
      puts "It's a tie between:"
      winners.each { |winner| puts "#{winner.name} with #{winner.hand.hand_strength}" }
    end
  end

  # Method to get player's action (fold, see, raise)
  def get_player_action(player)
    puts "#{player.name}, it's your turn. Your current pot: #{player.pot}"
    puts "Your hand: #{player.hand}"
    puts "Enter your action (fold/see/raise):"
    action = gets.chomp.downcase.to_sym
    case action
    when :fold
      return :fold
    when :see
      return :see, 0 # Seeing doesn't require any additional amount
    when :raise
      puts "Enter the amount you want to raise:"
      amount = gets.chomp.to_i
      # Validate if the player has enough funds to raise
      if amount <= player.pot
        return :raise, amount
      else
        puts "You don't have enough funds to raise by #{amount}."
        return get_player_action(player) # Ask for action again
      end
    else
      puts "Invalid action."
      return get_player_action(player) # Ask for action again
    end
  end
end