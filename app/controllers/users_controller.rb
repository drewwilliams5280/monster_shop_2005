class  UsersController < ApplicationController

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are now registered and logged in as #{@user.name}"
      session[:user_id] = @user.id
      redirect_to "/profile"
    else
      flash[:error] = @user.errors.full_messages.uniq.to_sentence
      render :new
    end
  end

  def show
    render file: "/public/404" unless current_user
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "Update Complete!"
      redirect_to '/profile'
    else
      flash[:notice] = "Please fill in the following fields: #{grab_empty_keys}"
      redirect_to '/profile/edit'
    end
  end

  private

  def user_params
    params.permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation)
  end

  def user_info
    params.permit(:name, :address, :city, :state, :zip)
  end

end
