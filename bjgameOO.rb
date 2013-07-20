class Card
  attr_accessor :value, :suit
  
  def initialize(v,s)
    @value = v
    @suit = s
  end

  def output
     "The #{value} of #{find_suit}."
  end

  def to_s
  output
  end
 
  def find_suit
    return_val = case suit
    when 'h' then "Hearts"
    when 'd' then "Diamonds"
    when 'c' then "Clubs"
    when 's' then "Spades"
    end
    return_val
  end
end

module Hand

  def show_hand
    puts "---- #{name}'s hand ----"
    cards.each do |c|
    puts "=> #{c}"
  end
    puts "=> Total: #{total}"
  end

  def total
    face_values = cards.map{|card| card.value}

    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
  end

    #correct for Aces
    face_values.select{|val| val == "A"}.count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def bust
    total > Blackjack::BJ_NATURAL
  end
end



class Player
  include Hand
  attr_accessor :name , :cards

  def initialize(n)
    @name = n
    @cards = []
  end
end

class Dealer
  include Hand
  attr_accessor :name , :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end
 
  def show_upcard
    puts "----Dealers Hand----"
    puts "Dealers upcard is a #{cards[1]}"
  end

end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |value|
      ['h','d','c','s'].each do |suit|
    @cards << Card.new(value,suit)
      end 
    end
  shuffle!
  end

  
  def shuffle!
    cards.shuffle!
  end
  
  def deal_hit
    cards.pop
  end
 
  def deck_size
  cards.size
  end
end


class Blackjack
  attr_accessor :deck , :player , :dealer

  BJ_NATURAL = 21
  DEALER_MIN = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player 1")
    @dealer = Dealer.new
  end

  def set_name
    puts "What is you name?"
    player.name = gets.chomp
  end

  def deal_cards
    player.add_card(deck.deal_hit)
    dealer.add_card(deck.deal_hit)
    player.add_card(deck.deal_hit)
    dealer.add_card(deck.deal_hit)
  end

  def show_upcard
    player.show_hand
    dealer.show_upcard
  end

  def bj_or_bust?(player_or_dealer)
    if player_or_dealer.total == BJ_NATURAL
      
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry dealer hit Blackjack, #{player.name} loses."
      else
        puts "Congratulations #{player.name} hits Blackjack and wins!!"
      end
      play_again?
   
    elsif player_or_dealer.bust
      
      if player_or_dealer.is_a?(Dealer)
        puts "Congratulations dealer busts, #{player.name} wins!!"
      else
        puts "Sorry #{player.name} busts and loses"
      end
      play_again?
    end
  end

  def players_turn
    puts "#{player.name}'s turn."

    bj_or_bust?(player)
    while !player.bust
      puts "What would you like to do? press 1) to hit or 2) to stand."
    choice = gets.chomp
      
      if !['1', '2'].include?(choice)
      puts "You must enter either a 1 or a 2."
      next
      end
     
      if choice == '2'
        puts "#{player.name} chooses to stands on total of #{player.total}"
        break
      end

      new_card = deck.deal_hit
      puts "#{player.name} draws  #{new_card}"
      player.add_card(new_card)
      puts "#{player.name} total is now #{player.total}"

      bj_or_bust?(player)
    end
      puts "#{player.name} stands on a total of #{player.total} "
    end

    def dealers_turn
      puts "Dealers turn:"
      bj_or_bust?(dealer)

      while dealer.total < DEALER_MIN
        new_card = deck.deal_hit
        puts "Dealer draws  #{new_card}"
        dealer.add_card(new_card)
        puts "Dealers total is now #{dealer.total}"

        bj_or_bust?(dealer)
        
      end
      puts "Dealer stands on a total of #{dealer.total}"
    end

    def outcome
      if dealer.total > player.total
        puts "Sorry the dealers #{dealer.total} beats #{player.name}'s total of #{player.total}"
      elsif player.total > dealer.total
        puts "#{player.name}'s total of #{player.total} beats the dealers #{dealer.total}"
      else
        puts "The game is a push both players have #{dealer.total}"
      end 
      play_again?
    end

    def play_again?
      puts ""
      puts "Would you like to play again 1) yes , 2) no, exit"
      
      if gets.chomp == '1'
        puts "Starting new game..."
        puts ""
        deck = Deck.new
        player.cards = []
        dealer.cards = []
        start
      else
        puts "Its been fun, goodbye!"
        exit
      end
    end

    def start
      set_name
      deal_cards
      show_upcard
      players_turn
      dealers_turn
      outcome
    end
end


game = Blackjack.new
game.start

