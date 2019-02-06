class CitiesController < ApplicationController
  def index

  end

  def show
    id = params["id"].to_i
    @city = City.find(id)
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
