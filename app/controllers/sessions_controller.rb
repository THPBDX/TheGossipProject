class SessionsController < ApplicationController
before_action :authenticate_user, only: [:index]


  def new_signup
render "/sessions/sign_up"
end

  def new_login
 render "/sessions/login"
  end

  def create_login
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email],first_name: params[:first_name],last_name: params[:last_name])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      flash.now[:success] = 'Vous êtes maintenant connecté.e'
      render '/'

    else
      flash.now[:danger] = 'Mauvaise combinaison d\'identifiant-mot de passe'
      render '/sessions/login'
    end
  end

    def create_signup
    City.find(name: params[:city])? nil : City.create!(name: params[:city],postal_code: params[:postal_code])
    user = User.create!(email: params[:email],first_name: params[:first_name],last_name: params[:last_name],city: City.where(name: params[:city]).first,password: params[:password],password_confirmation: params[:password_confirmation], age: params[:age])
  render '/sessions/login'

  end


def destroy
   session.delete(:user_id)
end

def authenticate_user
    unless current_user
      flash[:danger] = "Merci de te connecter"
      redirect_to '/sessions/login'
    end
  end

end
