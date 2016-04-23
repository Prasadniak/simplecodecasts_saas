class PostaggersController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @postagger = Postagger.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @postagger = Postagger.new(postagger_params)
        
        if @postagger.save
            content = params[:postagger][:content]
            response = Unirest.post "https://textanalysis.p.mashape.com/nltk-pos-tagging",
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
              #@neu = returnvalue["probability"]["neutral"]
              #@pos = returnvalue["probability"]["pos"]
              #@type = returnvalue["label"]
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to postaggers_path(current_user)
        end
    end
    
    def update
        redirect_to postaggers_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def postagger_params
           params.require(:postagger).permit(:content) 
        end
        
    
end