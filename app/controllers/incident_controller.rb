require './config/environment'
require 'pry'

class IncidentController < ApplicationController
    
    #index-show list of all recorded incidents
    get '/incidents' do
        redirect_if_not_logged_in
        @incidents = Incident.all
        erb :"/incidents/index"
    end
    
      #create-creates new incident
      post '/incidents' do
        redirect_if_not_logged_in
        current_user.incidents.create(params[:incident])
        redirect to '/incidents'
    end
    
      #new-return HTML form for creating a new incident
      get '/incidents/new' do
        redirect_if_not_logged_in
        erb :'incidents/new'
      end
    
      #show-display a specific incident based on incident ID
      get '/incidents/:id' do
        redirect_if_not_logged_in
        @incident = Incident.find(params[:id])
        erb :'incidents/show'
      end
    
      #edit-return an html form for editing an incident
      get '/incidents/:id/edit' do
        redirect_if_not_logged_in
        @incident = Incident.find(params[:id])
        authorize_to_edit(@incident)
        erb :'incidents/edit'
      end
    
      #update-update specific incident based on ID
      patch '/incidents/:id' do
        @incident = Incident.find(params[:id])
        authorize_to_edit(@incident)
        @incident.update(params[:incident])
        redirect to "/incidents"
      end
    
      #destroy-delete spcific incident based on ID
      delete '/incidents/:id' do
        @incident = Incident.find(params[:id])
        authorize_to_edit(@incident)
        @incident.destroy
        redirect to "/incidents"
      end

      private 
      
      def incident_params
        {
        
          victim_name:                        params[:victim_name], 
          victim_age:                         params[:victim_age], 
          victim_gender:                      params[:victim_gender], 
          victim_race:                        params[:victim_race], 
          victim_image_url:                   params[:victim_image_url], 
          incident_date:                      params[:incident_date],
          incident_street_address:            params[:incident_street_address], 
          incident_city:                      params[:incident_city], 
          incident_state:                     params[:incident_state], 
          incident_zip:                       params[:incident_zip], 
          incident_county:                    params[:incident_county],
          agency_responsible:                 params[:agency_responsible], 
          cause_of_death:                     params[:cause_of_death], 
          alleged_victim_crime:               params[:alleged_victim_crime], 
          crime_category:                     params[:crime_category], 
          solution:                           params[:solution], 
          incident_description:               params[:incident_description], 
          official_disposition_of_death:      params[:official_disposition_of_death], 
          criminal_charges:                   params[:criminal_charges],
          news_url:                           params[:news_url], 
          mental_illness:                     params[:mental_illness], 
          unarmed:                            params[:unarmed], 
          line_of_duty:                       params[:line_of_duty], 
          note:                               params[:note], 
          in_custody:                         params[:in_custody], 
          
        }
      end 






    end