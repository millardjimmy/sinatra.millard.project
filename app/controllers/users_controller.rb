require './config/environment'

class UsersController < ApplicationController
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get '/users/new' do
    if User.logged_in?(session) && user = User.current_user(session)
      redirect to "/users/#{user.id}"
    else
      erb :'/users/new'
    end
  end

  get '/users/login' do
    if User.logged_in?(session) && user = User.current_user(session)
      redirect to "/users/#{user.id}"
    else
      erb :'/users/login'
    end
  end

  get '/users/logout' do
    session.clear
    redirect to '/users/login'
  end

  get '/users/:id' do
    if User.logged_in?(session) && @user = User.current_user(session)
      erb :'/users/show'
    else
      redirect to '/'
    end
  end

  post '/users' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if user.save
      session[:user_id] = user.id

      redirect to "/users/#{user.id}"
    else
      redirect to '/users/new'
    end
  end

  post '/users/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      @error_message = "Invalid user info."
      erb :'/users/login'
    end
  end

end