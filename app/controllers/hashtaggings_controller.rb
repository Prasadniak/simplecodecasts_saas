class HashtaggingsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @hashtagging = Hashtagging.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        @hashtagging = Hashtagging.new(hashtagging_params)
        
        if @hashtagging.save
            content = params[:hashtagging][:content]
              textapi = AylienTextApi::Client.new(app_id: "0", app_key: "0")
                #url = "http://www.bbc.com/sport/0/football/25912393"
                
                response = textapi.hashtags(url: content)
                
                @hashreturn = response[:hashtags].join(', ')
                render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to hashtaggings_path(current_user)
        end
    end
    
    def update
        redirect_to hashtaggings_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def hashtagging_params
           params.require(:hashtagging).permit(:content) 
        end
        
    
end