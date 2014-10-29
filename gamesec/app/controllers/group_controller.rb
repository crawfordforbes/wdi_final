class GroupController < ApplicationController
	def create
		groupList =[]
		counter = 0
		while counter < 8
			if params["email" + counter.to_s] != ""
				groupList.push(params["email" + counter.to_s])
				counter += 1
			else 
				counter += 1
			end
		end
		admin = User.find_by(id: session[:user_id])
		newgroup = Group.create(name: params[:name])
		admin.groups << Group.find_by_name(newgroup.name)
		groupList.each do |email|
			user = User.find_by(email: email)
			if user != nil
			user.groups << Group.find_by_name(newgroup.name)
		end
		end
		session[:group_id] = Group.last.id
		puts "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
		puts session[:group_id]
		redirect_to '/'
	end
	#returns all users belonging to group
	def show
		@group = Group.find_by(id: params[:id])
		users = []
		@group.user_groups.collect { |a| users.push(a.user) }

		respond_to do |format|
			format.json { render :json => users}
		end
	end

	# returns all groups belonging to user
	def index
		puts "returning all groups belonging to user"
		@user = User.find_by(id: session[:user_id])
		groups = []
		@user.user_groups.collect { |a| groups.push(a.group) }

		respond_to do |format|
			format.json { render :json => groups}
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