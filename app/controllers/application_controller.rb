class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

   helpers do
    def is_logged_in? 
      !!session[:user_id]
    end
    
    def redirect_if_not_logged_in
      if !is_logged_in?
        redirect to '/login'
      end
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

  end


end