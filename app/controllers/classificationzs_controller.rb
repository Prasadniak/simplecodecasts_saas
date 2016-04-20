class ClassificationzsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @classificationz = Classificationz.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @classificationz = Classificationz.new(classificationz_params)
        
        if @classificationz.save
            content = params[:classificationz][:content]
            textapi = AylienTextApi::Client.new(app_id: "0", app_key: "0")
               classifications = textapi.classify(url: content)
                
                
                
              @labelr = classifications[:categories][0].fetch(:label)
              @textr = classifications.fetch(:text)
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to classificationzs_path(current_user)
        end
    end
    
    def update
        redirect_to classificationzs_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def classificationz_params
           params.require(:classificationz).permit(:content) 
        end
        
    
end