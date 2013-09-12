class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.find(user_params)
  	if @user.save
  		redirect_to products_url, :notice => "Signed up!"
  	else
  		render :new
  	end
  end

end

private

	def user_params
			params.require(:user)
				permit(:email, :password, :password_confirmation)
	end
