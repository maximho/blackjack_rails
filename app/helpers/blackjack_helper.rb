module BlackjackHelper

	CARDS = [{"Two_Clubs"=>2}, {"Two_Hearts"=>2}, {"Two_Spades"=>2}, {"Two_Diamonds"=>2},
		{"Three_Clubs"=>3}, {"Three_Hearts"=>3}, {"Three_Spades"=>3}, {"Three_Diamonds"=>3},
		{"Four_Clubs"=>4}, {"Four_Hearts"=>4}, {"Four_Spades"=>4}, {"Four_Diamonds"=>4},
		{"Five_Clubs"=>5}, {"Five_Hearts"=>5}, {"Five_Spades"=>5}, {"Five_Diamonds"=>5},
		{"Six_Clubs"=>6}, {"Six_Hearts"=>6}, {"Six_Spades"=>6}, {"Six_Diamonds"=>6},
		{"Seven_Clubs"=>7}, {"Seven_Hearts"=>7}, {"Seven_Spades"=>7}, {"Seven_Diamonds"=>7},
		{"Eight_Clubs"=>8}, {"Eight_Hearts"=>8}, {"Eight_Spades"=>8}, {"Eight_Diamonds"=>8},
		{"Nine_Clubs"=>9}, {"Nine_Hearts"=>9}, {"Nine_Spades"=>9}, {"Nine_Diamonds"=>9},
		{"Ten_Clubs"=>10}, {"Ten_Hearts"=>10}, {"Ten_Spades"=>10}, {"Ten_Diamonds"=>10},
		{"Jack_Clubs"=>10}, {"Jack_Hearts"=>10}, {"Jack_Spades"=>10}, {"Jack_Diamonds"=>10},
		{"Queen_Clubs"=>10}, {"Queen_Hearts"=>10}, {"Queen_Spades"=>10}, {"Queen_Diamonds"=>10},
		{"King_Clubs"=>10}, {"King_Hearts"=>10}, {"King_Spades"=>10}, {"King_Diamonds"=>10},
		{"Ace_Clubs"=>[1,11]}, {"Ace_Hearts"=>[1,11]}, {"Ace_Spades"=>[1,11]}, {"Ace_Diamonds"=>[1,11]}]


	def introduction_game
		puts "Welcome to the Blackjack game!"
		puts "Rules:\nThe Bank stand at 17.\nInsurance pays 2 to 1" 
	end

	def hit_or_stand
		puts "\nDo you want a card?? (hit or stand)"
		gets.chomp
	end

	def pick_card(cards)
		cards.delete_at(rand(0...cards.size))
	end

	def value(card, player_points) 
		if card.values.first.class == String
				card.values.first.to_i 
		elsif card.values.first.class == Array && player_points <= 11
				card.values.first.last.to_i
		else
				 card.values.first.to_i	   
		end
	end

	def resolution(player_points, bank_points)
		puts
		puts "Resolution:"
		puts "Your points: #{player_points} vs Bank points: #{bank_points}"

		if player_points <= 21 && bank_points <= 21
			if player_points > bank_points 
				puts "You won! :) Congratulation !!" 
			elsif player_points < bank_points
				puts "You lose! :( maybe next time mate..." 
			else
				puts "It's a tie!"
			end
		elsif player_points > 21 && bank_points <= 21
				puts "You lose! :( maybe next time mate..." 	
		elsif player_points <= 21 && bank_points > 21
				puts "You won! :) Congratulation !!" 
		else
				puts "Both lose :/"
		end
	end

	def player_feedback(player_points)
		if player_points > 21
		puts "You went too far :(\n"
		elsif player_points == 21 
		puts "Oh! Blackjack!! ;)\n"
		end
	end

	def calculation(points, player_cards)
		playercard = pick_card(CARDS)
		player_cards << playercard
		#card_name = playercard.keys.first
		card_value = value(playercard, points)
		points += card_value
		#puts "\n#{type} got #{card_name}(#{card_value} points)..\n#{type} have #{points} points"
		points
	end

	# introduction_game

	# player_cards = []
	# player_points = 0
	# bank_cards = []
	# bank_points = 0

	# while player_points < 21
	# 	decision = hit_or_stand
	# 	if decision != "hit" 
	# 		puts "You stand with #{player_points} points"	
	# 		break
	# 	else
	# 		player_points = calculation(player_points, player_cards, "Player")
	# 	end
	# end

	# player_feedback(player_points)


	# while bank_points < 17
	# 	bank_points = calculation(bank_points, bank_cards, "Bank")
	# end


	# resolution(player_points, bank_points)

end