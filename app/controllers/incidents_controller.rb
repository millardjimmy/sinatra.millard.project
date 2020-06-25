class IncidentController < ApplicationController
    
    get '/incidents' do
        @incidents = Incident.all 
        erb :"incidents/index"
    end 
    
    post '/incidents' do 
        @incident = Incident.new(params)
        @incident.save
        redirect "/incidents"
    end 
    
    get '/incidents/new' do 
        erb :"/incidents/new" 
    end 
    
    get '/incidents/:id' do 
    end 
    
    get '/incidents/:id/edit' do 
    end 
    
    patch '/incidents/:id' do 
    end 
    
    delete '/incidents/:id' do 
    end 

end 