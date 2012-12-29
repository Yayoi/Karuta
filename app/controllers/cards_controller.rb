#coding: utf-8
class CardsController < ApplicationController
  def index
		@cards = Card.all

		respond_to do |format|
			format.html
			format.json{render json: @cards }
		end

  end

  def show
		@card = Card.find(params[:card_id])
		respond_to do |format|
			format.html
			format.json { render json: @card }
		end
  end
	
	def question
		@cards = Card.all
		if params[:card_id] == '000' then
			@draw_card = Card.find_by_card_id('%03d' % (rand(10) + 1) )
		else
			@draw_card = Card.find_by_card_id(params[:card_id])
	
		end
		@draw_card_image = 'hyakunin-tori/tori-' << @draw_card.card_id << '.png'
		respond_to do |format|
			format.html
			format.json { render json: @draw_card }
		end

	end

	def check
		draw_id = params[:draw]
		ans_id = params[:ans]
		@draw_card = Card.find(draw_id)
		@card = Card.find(ans_id)
		@is_right_card
		if draw_id == ans_id then
			@is_right_card = true
		else
			@is_right_card = false
		end

	end

end