class SpellcheckingsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @spellchecking = Spellchecking.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @spellchecking = Spellchecking.new(spellchecking_params)
        
        if @spellchecking.save
            content = params[:spellchecking][:content]
            response = Unirest.post "https://textanalysis.p.mashape.com/textblob-spelling-correction",
              headers:{
                "X-Mashape-Key" => "0",
                "Content-Type" => "application/x-www-form-urlencoded",
                "Accept" => "application/json"
              },
              parameters:{
                "text" => "#{content}"
              }
                
              returnvalue = response.body  
              @result = returnvalue["result"]
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to spellcheckings_path(current_user)
        end
    end
    
    def update
        redirect_to spellcheckings_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def spellchecking_params
           params.require(:spellchecking).permit(:content) 
        end
        
    
end