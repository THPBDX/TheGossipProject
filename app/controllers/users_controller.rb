class UsersController < ApplicationController
  def index

  end

  def show
    id = params["id"].to_i
    @user = User.find(id)
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
