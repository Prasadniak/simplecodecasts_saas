class ConceptextractsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @conceptextract = Conceptextract.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        #@sentiment = @user.build_profile(profile_params)
        @conceptextract = Conceptextract.new(conceptextract_params)
        
        if @conceptextract.save
            content = params[:conceptextract][:content]
            textapi = AylienTextApi::Client.new(app_id: "0", app_key: "0")
                response = textapi.concepts(text: content)

                    @outputis = Array.new
                    
                    response[:concepts].each do |concept, value|
                      surface_forms = value[:surfaceForms].map { |c| c[:string] }.join(', ')
                      @outputis.push("#{concept} : #{surface_forms}")
                    end
                
                
              
              @returnis = @outputis
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to conceptextracts_path(current_user)
        end
    end
    
    def update
        redirect_to conceptextracts_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def conceptextract_params
           params.require(:conceptextract).permit(:content) 
        end
        
    
end