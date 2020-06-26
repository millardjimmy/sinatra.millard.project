class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret" 
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

  get '/signup' do
    if Helpers.is_logged_in?(session)
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
    if Helpers.is_logged_in?(session)
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
    if Helpers.is_logged_in?(session)
      session.clear
      redirect to "/login"
    else 
      redirect to "/"
    end
  end
end