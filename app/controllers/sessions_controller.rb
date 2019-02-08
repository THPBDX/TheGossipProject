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
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now[:success] = 'Vous êtes maintenant connecté.e'
      render '/home'

    else
      flash.now[:danger] = 'Mauvaise combinaison d\'identifiant-mot de passe'
      render '/sessions/login'
    end
  end

  def create_signup
    city = City.find_by(name: params[:city])
    if city == nil
      city = City.create!(name: params[:city],postal_code: params[:postal_code])
    end
    user = User.create!(email: params[:email],first_name: params[:first_name],last_name: params[:last_name],city: city, password: params[:password],password_confirmation: params[:password_confirmation], age: params[:age])
    render '/home'

  end


  def destroy
    puts "param_id: #{params[:id]}"
    puts "param_user_id: #{params[:user_id]}"
    puts "user_id: #{:user_id}"
    session.delete(params[:id])
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Merci de te connecter"
      redirect_to '/sessions/login'
    end
  end

end
