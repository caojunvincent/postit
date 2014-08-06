class SessionsController < ApplicationController

  def new
  end

  def create
    # ex user.authenticate('password')
    # 1. get the user obj
    # 2. see if password mathes
    # 3. if so, login
    # 4. if not, error msg
    
    user = User.find_by_username(params[:username])
  end

  def destroy

  end
end
