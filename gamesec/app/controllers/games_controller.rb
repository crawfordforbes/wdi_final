class GameController < ApplicationController

	def create
		game = Game.create(name: params[:name], max_score: params[:max_score], rolls: 0, group_id: params[:group_id], winner: 0, turns: 0)		

		respond_to do |format|
			format.json { render :json => game}
		end
	end

	def show
		game = Game.find_by(id: params[:id])

		respond_to do |format|
			format.json { render :json => game}
		end
	end

	def update
		game = Game.find_by(id: params[:id])
		game.update(name: params[:name], max_score: params[:max_score], rolls: params[:rolls], group_id: params[:group_id], winner: params[:winner], turns: params[:turns])

		respond_to do |format|
			format.json { render :json => game}
		end
	end

	def destroy
		game = Game.find_by(id: params[:id])
		game.destroy
	end

end