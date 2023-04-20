class ChatsController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def create
        
    end
    private
    
end
