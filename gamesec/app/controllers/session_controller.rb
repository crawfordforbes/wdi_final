class SessionController < ApplicationController

	def new
		if session[:user_id]
			@user = User.find_by(id: session[:user_id])
		else
			@user = nil
		end
		render :new
	end

	def create
		@user = User.find_by(email: params[:email])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to '/'
			puts "signed in"
		else 
			reset_session
			@error = true
			puts "error"
			redirect_to '/'
		end

	end

	def destroy
		puts "DESTROY"
		reset_session
		redirect_to '/'

	end

end
