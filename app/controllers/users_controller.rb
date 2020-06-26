require './config/environment'

class UsersController < ApplicationController
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  #new-return form for creating users
  get '/users/new' do
    if User.is_logged_in?(session) && user = User.current_user(session)
      redirect to "/users/#{user.id}"
    else
      erb :'/users/new'
    end
  end

  #validates whether user is logged in and takes user to user profile page
  get '/users/login' do
    if User.is_logged_in?(session) && user = User.current_user(session)
      redirect to "/users/#{user.id}"
    else
      erb :'/users/login'
    end
  end

  #clears session upon log out
  get '/users/logout' do
    session.clear
    redirect to '/users/login'
  end

  #allows user to view incidents
  get '/users/:id' do
    if User.is_logged_in?(session) && @user = User.current_user(session)
      erb :'/users/show'
    else
      redirect to '/'
    end
  end

  #create-creates new user
  post '/users' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if user.save
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      redirect to '/users/new'
    end
  end

  #authenticates user
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