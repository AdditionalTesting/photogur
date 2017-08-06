class UsersController < ApplicationController

def new
  @user = User.new

end

def create
  @user = User.new(user_params)


  if @user.save
    flash[:notice] = "User successfully created!"
      # if the user gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
end

def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
end

end
