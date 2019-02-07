class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :authenticate_user, except: [:home]


  def home
    render "/home"
  end

  private

  def authenticate_user
      unless current_user
        # flash[:danger] = "Merci de te connecter"
        redirect_to '/sessions/sign_up'
      end
    end



end
