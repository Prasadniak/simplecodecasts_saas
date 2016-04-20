class LemmatizzersController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @lemmatizzer = Lemmatizzer.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @lemmatizzer = Lemmatizzer.new(lemmatizzer_params)
        
        if @lemmatizzer.save
            content = params[:lemmatizzer][:content]
            response = Unirest.post "https://textanalysis.p.mashape.com/nltk-wordnet-lemmatizer",
              headers:{
                "X-Mashape-Key" => "",
                "Content-Type" => "application/x-www-form-urlencoded",
                "Accept" => "application/json"
              },
              parameters:{
                "text" => "#{content}"
              }
                
              returnvalue = response.body  
              @result = returnvalue
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to lemmatizzers_path(current_user)
        end
    end
    
    def update
        redirect_to lemmatizzers_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def lemmatizzer_params
           params.require(:lemmatizzer).permit(:content) 
        end
        
    
end