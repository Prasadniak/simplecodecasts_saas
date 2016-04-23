class SentimentsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @sentiment = Sentiment.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @sentiment = Sentiment.new(sentiment_params)
        
        if @sentiment.save
            content = params[:sentiment][:content]
            response = Unirest.post "https://japerk-text-processing.p.mashape.com/sentiment/",
              headers:{
                "X-Mashape-Key" => "Yg3OfGdmHFmshMsqaxsUodfaSly4p1NE5FAjsnxWPs41Y4p7hz",
                "Content-Type" => "application/x-www-form-urlencoded",
                "Accept" => "application/json"
              },
              parameters:{
                "language" => "english",
                "text" => "#{content}"
              }
                
              returnvalue = response.body  
              @neg = returnvalue["probability"]["neg"]
              @neu = returnvalue["probability"]["neutral"]
              @pos = returnvalue["probability"]["pos"]
              @type = returnvalue["label"]
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to sentiments_path(current_user)
        end
    end
    
    def update
        redirect_to sentiments_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def sentiment_params
           params.require(:sentiment).permit(:content) 
        end
        
    
end