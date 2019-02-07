class UsersController < ApplicationController
  def index

  end

  def show
    puts "params :"
    puts params
    id = params["id"].to_i
    puts "L'ID du user :"
    puts id
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
