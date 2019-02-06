class MessageController < ApplicationController
  def show
    @user = User.new
    @user.first_name = @name
    @user.save
  end
  # def show_post
  # end
end
