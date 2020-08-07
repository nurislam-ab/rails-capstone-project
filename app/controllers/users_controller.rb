# Class documentation comment
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = obtain_user_with_resources
  end

  def edit
    @user = obtain_user_only
  end

  def update
    @user = obtain_user_only

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = obtain_user_only
    @user.destroy

    redirect_to users_admin_path, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def obtain_user_only
    User.find(params[:id])
  end

  def obtain_user_with_resources
    User.includes(:articles, :votes).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :name, :surname, :avatar, :bio, :website)
  end
end
