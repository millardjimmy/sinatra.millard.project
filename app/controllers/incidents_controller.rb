class IncidentController < ApplicationController
    
    #index-show list of all recorded incidents
    get '/incidents' do
        if !Helpers.is_logged_in?(session)
          redirect to "/login"
        end
          
        @user = Helpers.current_user(session)
        @incidents = incidents.all
        erb :"/incidents/index"
      end
    
      #create-creates new incident
      post '/incidents' do
        if params[:content].empty?
          redirect to "/incidents/new"
        else
          @incidents = Helpers.current_user(session).incidents.create(content: params[:content])
          redirect to "/incidents"
        end
      end
    
      #new-return HTML form for creating a new incident
      get '/incidents/new' do
        if Helpers.is_logged_in?(session)
          erb :"/incidents/new"
        else 
          redirect to "/login"
        end 
      end
    
      #show-display a specifi incident based on incident ID
      get '/incidents/:id' do
        if Helpers.is_logged_in?(session)
          @incidents = incidents.find(params[:id])
          erb :"/incidents/show"
        else
          redirect to "/login"
        end
      end
    
      #edit-return an html form for editing an incident
      get '/incidents/:id/edit' do
        if Helpers.is_logged_in?(session) && @incidents = Helpers.current_user(session).incidents.find_by(id: params[:id])
          erb :"/incidents/edit"
        else 
          redirect to "/login"
        end
      end
    
      #update-update specific incident based on ID
      patch '/incidents/:id' do
        incidents = incidents.find_by(id: params[:id])
        if params[:content].empty?
          redirect to "/incidents/#{incidents.id}/edit"
        else 
          incidents.update(content: params[:content])
          incidents.save
        end 
      end
    
      #destroy-delete spcific incident based on ID
      delete '/incidents/:id' do
        incidents = incidents.find_by(id: params[:id])
        incidents.delete if incidents.user == Helpers.current_user(session)
        redirect to "/incidents"
      end
    end