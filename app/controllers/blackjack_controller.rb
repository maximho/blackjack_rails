class BlackjackController < ApplicationController

	include BlackjackHelper

	def game
		start_cards = pick_card(CARDS)
		@player_cards = params[:player_cards] || [] << start_cards
		@player_points = params[:player_points] || value(start_cards, 0)
		@type = params[:type] || "Player"
		@card_name = @player_cards.first.keys.last
		
		@bank_cards ||= []
		@bank_points ||= 0
		@test = params.fetch(:hit) if params[:hit] #if is true  #@test = params["hit"]  {"hit"=>"Max", "controller"=>"blackjack", "action"=>"game"}
	end

	def hit
		pp = params[:test].to_i
		pc = params[:pc]

		@player_cards = params.fetch(:pc)
		@player_points = calculation(pp, pc)
		redirect_to root_path(:player_points => @player_points, :player_cards => @player_cards, :type => "Player")
	end

	def stand
		@stand_resolution = "You stand with #{player_points} points"	
		redirect_to root_path(:stand => @stand_resolution)
	end


end