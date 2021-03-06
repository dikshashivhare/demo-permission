class UsersController < ApplicationController
	before_action :authenticate_user!

	
    def index
		@users = User.all
    end

    def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to users_path
	end

 	def edit
 		@user = User.find (params[:id])
 	end

 	def update
 		@user = User.find (params[:id])
 		if @user.update(user_params)
 		   redirect_to users_path
 			
 		else
 			render 'edit'
 		end
 	end

 	def destroy
 		@user = User.find (params[:id])
 		@user.destroy
 		redirect_to users_path
 	end

 	

 	

	private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end



end
