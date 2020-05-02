class UsersController < ApplicationController
  def index
    users = User.all
    render_ok(users)
  end

  def show
    render_ok(find_user)
  end

  def update
  end

  def create
    user = User.new(user_params)
    if user.save
      render_created({jwt: generate_access_token(user.id), refresh_token: user.refresh_token})
    else
      render_errors({errors: user.errors.full_messages.join(', ')})
    end
  end

  def delete
  end

  private
  
  def find_user
    User.find(user_params[:id])
  end

  def user_params
    params.permit(:id, :email, :password, :firstname, :lastname, :username)
  end
end
