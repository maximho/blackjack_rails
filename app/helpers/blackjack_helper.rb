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

	def card_info(type, card_name, total_points)
		"<h4>#{type}'s card show #{card_name}. #{type} now has #{total_points} total points.</h4>".html_safe
	end

	def resolution(player_points, bank_points)
		if player_points.to_i <= 21 && bank_points.to_i <= 21
			if player_points.to_i > bank_points.to_i
				"<h1>You won! :) Congratulation !!</h1>".html_safe
			elsif player_points.to_i < bank_points.to_i
				"<h1>You lose! :( maybe next time mate...</h1>".html_safe
			else
				"<h1>It's a tie!</h1>".html_safe
			end
		elsif player_points.to_i > 21 && bank_points.to_i <= 21
				"<h1>You lose! :( maybe next time mate...</h1>".html_safe
		elsif player_points.to_i <= 21 && bank_points.to_i > 21
				"<h1>You won! :) Congratulation !!</h1>".html_safe
		else
				"<h1>Both lose :/</h1>".html_safe
		end
	end

	def player_feedback(player_points)
		if player_points.to_i > 21
			"<h1>You went too far :(</h1>".html_safe
		elsif player_points.to_i == 21
			"<h1>Oh! Blackjack!! ;)</h1>".html_safe
		end
	end

	def calculation(points, player_cards)
		playercard = pick_card(CARDS)
		player_cards << playercard
		card_value = value(playercard, points)
		points += card_value
	end

end
