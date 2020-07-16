class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
    set :show_exceptions, true
    
  end

  error ActiveRecord::RecordNotFound do
    redirect to '/'
  end

  not_found do
    status 404
    erb :error
  end

  get '/' do
    erb :welcome
  end

   helpers do
    def is_logged_in? 
      !!session[:user_id]
    end
    
    #this can be private
    def authorize_to_edit(incident)
      if !incident || incident.user != current_user
       redirect to '/incidents'
      end
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

  end

private

def redirect_if_not_logged_in
  if !is_logged_in?
    redirect to '/login'
  end
end




end



