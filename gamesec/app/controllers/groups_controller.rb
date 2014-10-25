class GroupController < ApplicationController
	def create
		group = Group.create(name: params[:name])
		members = User_group.create(user_id: params[:user_id], group_id: group.id)

		respond_to do |format|
			format.json { render :json => group}
		end
	end

	def show
		group = Group.find_by(id: params[:id])

		respond_to do |format|
			format.json { render :json => group}
		end
	end

	def update
		group = Group.find_by(id: params[:id])

		group.update(name: params[:name])
		if params[:population] > 0
			counter = 0
			while counter < params[:population]
				User_group.create(user_id: params["user_id#{counter}"], group_id: group.id)
				counter += 1
			end
		end
		respond_to do |format|
			format.json { render :json => group}
		end
	end

	def destroy
		group = Group.find_by(id: params[:id])

		group.destroy
	end
end