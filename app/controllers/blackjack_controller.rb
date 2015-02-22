class BlackjackController < ApplicationController

	include BlackjackHelper

	def game
		player_start_card = pick_card(CARDS)
		@player_cards = params[:player_cards] || [] << player_start_card
		@player_points = params[:player_points] || value(player_start_card, 0)
		@player_card_name = @player_cards.first.keys.last

		@stand = params[:stand] || false

		bank_start_card = pick_card(CARDS)
		@bank_cards = params[:bank_cards] || [] << bank_start_card
		@bank_points = params[:bank_points] || value(bank_start_card, 0)
		@bank_card_name = @bank_cards.first.keys.last
	end

	def hit
		pp = params[:pp].to_i
		pc = params[:pc]
		@player_cards = params.fetch(:pc)
		@player_points = calculation(pp, pc)

		bp = params[:bp].to_i
		bc = params[:bc]
		@bank_cards = params.fetch(:bc)
		@bank_points = params.fetch(:bp)

		redirect_to root_path(:player_points => @player_points, :player_cards => @player_cards, :bank_points => @bank_points, :bank_cards => @bank_cards)
	end

	def stand
		@bank_cards = params[:bc]
		@bank_points = params[:bp].to_i

		@player_cards = params.fetch(:pc)
		@player_points = params.fetch(:pp)

		@stand = true

		while @bank_points < 17
			@bank_points = calculation(@bank_points, @bank_cards)
		end

		redirect_to root_path(:stand => @stand, :player_points => @player_points, :player_cards => @player_cards, :bank_points => @bank_points, :bank_cards => @bank_cards)
	end


end
