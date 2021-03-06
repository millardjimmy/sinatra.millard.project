require './config/environment'

class UsersController < ApplicationController
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/signup' do
    erb :'users/signup'
end

post '/signup' do
    user = User.new(params[:user])
    if user.save
        session[:user_id] = user.id
        redirect to '/incidents'
    else
        erb :'users/signup'
    end
end

get '/login' do
    erb :'users/login'
end

post '/login' do
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect to '/incidents'
    else
        redirect to '/login'
    end
end

get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
end
end