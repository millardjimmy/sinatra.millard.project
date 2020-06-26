class IncidentController < ApplicationController
    
    get '/incidents' do
        @incidents = Incident.all 
        erb :"incidents/incidents"
    end 
    
    post '/incidents' do 
        @incident = Incident.new(params)
        @incident.save
        redirect "/incidents/incidents"
    end 
    
    get '/incidents/new' do 
        erb :"/incidents/create_incident" 
    end 
    
    get '/incidents/:id' do 
    end 
    
    get '/incidents/:id/edit' do 
    end 
    
    patch '/incidents/:id' do 
    end 
    
    delete '/incidents/:id' do 
        @incident = Incident.find_by_id(params[:id])
        @incident.destroy
    end 

end 