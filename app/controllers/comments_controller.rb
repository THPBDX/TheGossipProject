class CommentsController < ApplicationController
  def index

  end

  def show
      @user=User.new
      @comment = Comment.create!(gossip: Gossip.where(id: params[:id]), user: User.where content: params[:content])
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
