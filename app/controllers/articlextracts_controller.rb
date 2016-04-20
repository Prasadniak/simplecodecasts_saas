class ArticlextractsController < ApplicationController
    require 'aylien_text_api'
    require 'json'
    require 'unirest'
    
    def index
        @articlextract = Articlextract.new
    end
        
        
    def create
        #@user = User.find( params[:user_id] )
        @articlextract = Articlextract.new(articlextract_params)
        
        if @articlextract.save
            content = params[:articlextract][:content]
            textapi = AylienTextApi::Client.new(app_id: "0", app_key: "0")
                #url = "http://techcrunch.com/2015/04/06/john-oliver-just-changed-the-surveillance-reform-debate"
                extract = textapi.extract(url: content, best_image: true)
                
                

              @author = extract[:author]
              @title = extract[:title]
              @publishDate = extract[:publishDate]
              @videos = extract[:videos]
              @feeds = extract[:feeds]
              render :index
            #flash[:success] = "your analysis is done"
            #redirect_to sentiments_path(current_user)
        else
            flash[:danger] = 'Your input is not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
            redirect_to articlextracts_path(current_user)
        end
    end
    
    def update
        redirect_to articlextracts_path(current_user)
        flash[:danger] = 'Parameters are not correct or cannot be read, Cannot do Analysis Successfully , Please Try Again!!'
    end
    
    private 
        def articlextract_params
           params.require(:articlextract).permit(:content) 
        end
        
    
end