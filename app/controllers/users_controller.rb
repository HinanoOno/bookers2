class UsersController < ApplicationController
  def index
    @users=User.all
    @user=User.find(current_user.id)
    @newbook=Book.new
  end
  def show
    @user=User.find(params[:id])
    @newbook=Book.new
    @books=@user.books
  end

  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    
    @user=User.find(params[:id])
    if(@user.update(user_params))
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
