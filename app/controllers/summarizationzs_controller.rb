class SummarizationzsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @summarizationz = Summarizationz.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        @summarizationz = Summarizationz.new(summarizationz_params)
        
        if @summarizationz.save
            content = params[:summarizationz][:content]
            #textapi = AylienTextApi::Client.new(app_id: "0", app_key: "0")
             textapi = AylienTextApi::Client.new(app_id: "91602221", app_key: "67eddfa37211bb4bf28f3eb6f54651c7")
                #url = 'http://techcrunch.com/2015/04/06/john-oliver-just-changed-the-surveillance-reform-debate'
                
                summary = textapi.summarize(url: content, sentences_number: 3)
                @outputis = Array.new
                summary[:sentences].each do |sentence|
                  @outputis.push(sentence)
                end

              @returnis = @outputis
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to summarizationzs_path(current_user)
        end
    end
    
    def update
        redirect_to summarizationzs_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def summarizationz_params
           params.require(:summarizationz).permit(:content) 
        end
        
    
end