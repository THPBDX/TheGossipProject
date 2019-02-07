class GossipsController < ApplicationController

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    @gossip = Gossip.new
    puts "params :"
    puts params
    puts params[:id]
    id = params[:id]
    puts id
    puts Gossip.find(id)
    @gossip = Gossip.find(id)
    puts @gossip
  end

  def new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    # A changer avec le user loggé
    @user = User.first
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.new(title: params[:title],content: params[:content],user: @user) # avec xxx qui sont les données obtenues à partir du formulaire
    puts @gossip.title
    puts @gossip.content
    puts @gossip.user

  if @gossip.save # essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
    render "/gossips/show"
  else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    render "gossips/new"
  end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

    @gossip = Gossip.find(params[:id])
    # A changer avec le user loggé
    @user = User.first
        if @gossip.update(title: params[:title],content: params[:content],user: @user)
        redirect_to @gossip
      else
        render :edit
      end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find(params[:id])
    @jointablegossiptag = JoinTableGossipTag.where(id: @gossip.id)
    @jointablegossiptag.delete_all
    @gossip.destroy
    redirect_to "/gossips"
  end
end
