class NounphrasesextractionsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @nounphrasesextraction = Nounphrasesextraction.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @nounphrasesextraction = Nounphrasesextraction.new(nounphrasesextraction_params)
        
        if @nounphrasesextraction.save
            content = params[:nounphrasesextraction][:content]
            response = Unirest.post "https://textanalysis.p.mashape.com/textblob-noun-phrase-extraction",
              headers:{
                "X-Mashape-Key" => "",
                "Content-Type" => "application/x-www-form-urlencoded",
                "Accept" => "application/json"
              },
              parameters:{
                "text" => "#{content}"
              }
                
              returnvalue = response.body  
              @result = returnvalue["noun_phrases"]
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to nounphrasesextractions_path(current_user)
        end
    end
    
    def update
        redirect_to spellcheckings_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def nounphrasesextraction_params
           params.require(:nounphrasesextraction).permit(:content) 
        end
        
    
end