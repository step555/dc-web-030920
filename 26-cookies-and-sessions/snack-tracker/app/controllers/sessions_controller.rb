class SessionsController < ApplicationController

  def login
    # loads login view
  end

  def process_login
    # processes form to login user

    # check if user with given username is in database 
    user = User.find_by(username: params[:username])

    if user
        # if they are, log them in and redirect to snack index

        session[:user_id] = user.id
        redirect_to snacks_path

    else
        # if not, show an error and redisplay login form
        flash["error"] = "No user found with that name"
        render :login
    end
  end


end
