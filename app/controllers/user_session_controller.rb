class UserSessionController < ApplicationController
  skip_before_filter :require_user, :except => :destroy
  before_filter :require_no_user, :except => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new params[:user_session]
    if @user_session.save
      redirect_to new_datum_path
    else
      flash[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    current_user.destroy
    redirect_to login_path
  end
end
