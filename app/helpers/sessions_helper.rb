module SessionsHelper
  def current_user
   User.find_by(id: session[:user_id])
 end

  def log_in(user)
   session[:user_id] = user.id
 end

  def logged_in?
    is_logged = (session[:user_id] != nil)
    puts "is_logged: #{is_logged}"
    session[:user_id] != nil
  end

  def new
  end

  def show
  end

end
