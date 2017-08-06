class UsersController < ApplicationController

def new
  @user = User.new

end

def create
  @user = User.new
  @user.email = params[:user][:email]
  @user.password = params[:user][:password]
  @user.password_confirmation = params[:user][:password_confirmation]

  if @user.save
    flash[:notice] = "User successfully created!"
      # if the user gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
end


end
