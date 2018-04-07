class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show

  end

  def delete
    @user.destroy
    redirect_to users_path, notice: "#{@user.name} was deleted!"
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "#{@user.name} was updated!"
    else
      render :edit
    end

  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User created'
    else
      puts @user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, notes_attributes:[:body, :id, :_destroy])
    end

    def find_user
      @user = User.find(params[:id])
    end

end
