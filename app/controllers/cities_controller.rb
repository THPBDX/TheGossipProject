class CitiesController < ApplicationController
  def index

  end

  def show
    puts Gossip.first.title
    puts "params :"
    puts params
    id = params[:id]
    puts "L'ID de la ville :"
    puts id
    @city = City.find(id)

    @gossip1 = Gossip.first
    puts "premier gossip"
    puts @gossip1

    @users = User.joins(:city).where(cities: {name: @city.name})
    @gossips = Gossip.where(user: @users)
    puts "matching gossips"
    puts @gossips
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
