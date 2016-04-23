class StemmersController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @stemmer = Stemmer.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @stemmer = Stemmer.new(stemmer_params)
        
        if @stemmer.save
            content = params[:stemmer][:content]
           response = Unirest.post "https://textanalysis.p.mashape.com/nltk-porter-stemmer",
                  headers:{
                    "X-Mashape-Key" => "Yg3OfGdmHFmshMsqaxsUodfaSly4p1NE5FAjsnxWPs41Y4p7hz",
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
            redirect_to stemmers_path(current_user)
        end
    end
    
    def update
        redirect_to stemmers_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def stemmer_params
           params.require(:stemmer).permit(:content) 
        end
        
    
end