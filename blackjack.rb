puts "--Welcome to Pedro's Casino Blackjack--"
suit = ['h','c','s','d']
value =['2','3','4','5','6','7','8','9','10','J','Q','K','A']
#make/shuffle deck
deck= value.product(suit)
deck.shuffle!

#hand total
def calc_total (hand)
arr = hand.map {|e| e[0] }
total = 0
  arr.each do |val| 
   if val == 'A'
      total += 11
    elsif val.to_i == 0
      total += 10
    else total += val.to_i
    end
  end
  arr.select {|a| a =='A'}.count.times do
    if total > 21
      total -= 11
    end
    
  end
  total
end



#deal
dealers_hand = []
players_hand = []
players_hand << deck.pop
dealers_hand << deck.pop
players_hand << deck.pop
dealers_hand << deck.pop
players_total = calc_total(players_hand)
dealers_total = calc_total(dealers_hand)


puts "Players cards are: #{players_hand} for a total of: #{players_total} "
puts "Dealers upcard is: #{dealers_hand [0]} "  
if players_total == 21 && dealers_total != 21
  puts "You win!!!"
  puts "Player has Blackjack" 
  exit
elsif dealers_total == 21 && players_total !=21
 puts "Dealer has #{dealers_hand [1]} in the hole."
 puts "You Lose.."
 puts "Dealer has Blackjack"
 exit
 elsif  dealers_total == 21 && players_total == 21
  puts "Game is a draw,"
  puts "Both player have Blackjack"
  exit
end
puts ""

def make_choice
puts "Would you like to hit or stand?"
puts "Enter 1 to hit or 2 to stand"
action = gets.chomp
action
end





if make_choice == "1"  #play players hand
  players_hand << deck.pop 
  puts "You received a " + players_hand.last.to_s
  players_total = calc_total(players_hand)
  puts "You new total is #{players_total}"
    if players_total > 21
      puts "You bust and lose!"
    #else
     # make_choice 
    end
elsif make_choice == "2" #play dealers hand
  puts "Dealers hole card is: #{dealers_hand[1]}"
  puts "Dealers total is #{dealers_total}"
    while dealers_total < 17
      dealers_hand << deck.pop
      puts "Dealer draws a " + dealers_hand.last.to_s
      dealers_total= calc_total(dealers_hand)
      puts "Dealer has a total of #{dealers_total}"
    end
      if dealers_total > 21 # determine winner
        puts "Dealer bust, you win"
        elsif dealers_total > players_total
          puts "You Lose..."
          puts "Dealers total of #{dealers_total} beats your total of #{players_total}"
        elsif players_total > dealers_total
          puts "You Win!!!"
          puts "Your total of #{players_total} beat the dealers total of #{dealers_total}"
        elsif dealers_total == players_total
          puts "Game is a push"
          puts "Both players have a total of #{dealers_total}"
      end
else
  puts "Error, Please enter either a 1 for hit or 2 for stand"
end
exit











