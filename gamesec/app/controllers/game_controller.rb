class GameController < ApplicationController

	def create
		puts "create games hit"
		@group = Group.find_by(id: params[:group_id])
		session[:group_id] = params[:group_id]
		game = Game.create(group_id: params[:group_id].to_i, in_progress: false, name: params[:name], max_score: params[:max_score])		
		puts("Game created")
		puts game.id
		session[:game_id] = game.id

		redirect_to '/game'
	end

	def show
		puts "game show"
		game = Game.find_by(id: session[:game_id])
		puts game.name
		respond_to do |format|
			format.json { render :json => game}
		end
	end

	def index
		game = Game.find_by(id: session[:game_id])
		puts "game id:"
		puts params
		respond_to do |format|
			format.json { render :json => game}
			format.html {render :game }
		end

	end

	def update
		puts params
		game = Game.find_by(id: params[:id])
		game.update(max_score: params[:max_score], rolls: params[:rolls], group_id: params[:group_id], winner: params[:winner], turns: params[:turns])

		redirect_to '/game'
		
	end


	def destroy
		game = Game.find_by(id: params[:id])
		game.destroy
	end

end