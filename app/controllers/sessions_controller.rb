class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      #session[:current_timesheet] = Timesheet.current_task(user.id)

      redirect_to_target_or_default timesheets_path, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "You have been logged out."
  end
end
