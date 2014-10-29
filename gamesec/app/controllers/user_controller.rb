class UserController < ApplicationController
	respond_to :html, :xml, :json
	def create
		@user = User.create(name: params[:name], email: params[:email], password: params[:password], games_played: 0, games_won: 0, score: 0)

		redirect_to '/'
	end

	def show
		@user = User.find_by(id: params[:id])
		
		respond_with(@user)
	end

	def update
		

		puts("user update time!")
		@user = User.find_by(id: params[:id])
		if params[:score] == session[:max_score]
			wins = @user.games_won 
			@user.update(games_won: wins + 1)
		else

			if params[:name]
				@user.update(name: params[:name])
			elsif params[:email]
				@user.update(email: params[:email])
			elsif params[:password]
				@user.update(password: params[:password])
			elsif params[:games_played]
				@user.update(games_played: params[:games_played])
			elsif params[:games_won]
				@user.update(games_won: params[:games_won])
			elsif params[:score]
				@user.update(score: params[:score])
			end
		end
		# @user.update(name: params[:name], email: params[:email], password: params[:password], games_played: params[:games_played], games_won: params[:games_won], score: params[:score])
		respond_to do |format|
			format.json { render :json => @user}
		end
	end

	def destroy
		@user = User.find_by(id: params[:id])

		@user.destroy
	end

end