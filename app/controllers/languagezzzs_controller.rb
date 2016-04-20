class LanguagezzzsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @languagezzz = Languagezzz.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @languagezzz = Languagezzz.new(languagezzz_params)
        
        if @languagezzz.save
            content = params[:languagezzz][:content]
            response = Unirest.post "https://textanalysis.p.mashape.com/langid-language-detection",
              headers:{
                "X-Mashape-Key" => "0",
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
            redirect_to languagezzzs_path(current_user)
        end
    end
    
    def update
        redirect_to languagezzzs_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def languagezzz_params
           params.require(:languagezzz).permit(:content) 
        end
        
    
end