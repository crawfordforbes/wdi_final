class UserController < ApplicationController
	def create
		user = User.create(name: params[:name], email: params[:email], password: params[:password], games_played: 0, games_won: 0)
		respond_to do |format|
			format.json { render :json => user}
		end
	end

	def show
		user = User.find_by(id: params[:id])
		respond_to do |format|
			format.json { render :json => user}
		end
	end

	def update
		user = User.find_by(id: params[:id])

		user.update(name: params[:name], email: params[:email], password: params[:password], games_played: params[:games_played, games_won: params[:games_won])
		respond_to do |format|
			format.json { render :json => user}
		end
	end

	def destroy
		user = User.find_by(id: params[:id])

		user.destroy
	end

end