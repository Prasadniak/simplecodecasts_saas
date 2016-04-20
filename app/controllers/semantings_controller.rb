class SemantingsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @semanting = Semanting.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        @semanting = Semanting.new(semanting_params)
        
        if @semanting.save
            content = params[:semanting][:content]
            content1 = params[:semanting][:content1]
              textapi = AylienTextApi::Client.new(app_id: "0", app_key: "0")
                    classes = ["#{content1}",'']
                    
                    classifications = textapi.unsupervised_classify(url: content, class: classes)
                    
                    @semantingreturnis = Array.new
                    
                    
                      @semantingreturnis.push(classifications)
                    
                @return = @semantingreturnis
                render :index
            flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to semantings_path(current_user)
        end
    end
    
    def update
        redirect_to semantings_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def semanting_params
           params.require(:semanting).permit(:content, :content1) 
        end
        
    
end