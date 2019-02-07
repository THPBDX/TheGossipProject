class SessionsController < ApplicationController
before_action :authenticate_user, only: [:index]

  def new
    render '/sessions/new'
end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      flash.now[:success] = 'Vous êtes maintenant connecté.e'
      render '/'

    else
      flash.now[:danger] = 'Mauvaise combinaison d\'identifiant-mot de passe'
      render '/sessions/new'
    end
  end

def index
  render '/'
end

def destroy
   session.delete(:user_id)
end

def authenticate_user
    unless current_user
      flash[:danger] = "Merci de te connecter"
      redirect_to '/sessions/new'
    end
  end

end
