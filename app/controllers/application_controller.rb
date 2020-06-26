class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, ENV['SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

  get '/signup' do
    if is_logged_in?
      redirect to "/incidents"
    else
      erb :signup
    end
  end

  post '/signup' do
    if params.values.all? { |value| value != ""}
      user = User.create(params)
      session[:user_id] = user.id
      redirect to "/"
    else
      redirect to "/signup"
    end
  end

  get '/login' do
    if is_logged_in?
      redirect to "/"
    end
    erb :login
  end
  
  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/"
    else
      redirect to "/login"
    end
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      redirect to "/login"
    else 
      redirect to "/"
    end
  end

   helpers do
    def is_logged_in?
      !!session[:user_id]
    end
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect to '/login'
      end
    end

    def current_user
      if @current_user !=nil
        @current_user
      else
        @current_user= User.find_by(id: session[:user_id])
      end
    end
  end


end