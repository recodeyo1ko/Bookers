class ChatsController < ApplicationController
    def show
        @user = User.find(params[:id])
        
    end

    def create
        @chat = current_user.chats.new(chat_params)
        @room = @chat.room
        @chats = @room.chats
        # if @chat.save
        #     redirect_to 
    end
    private
    def chat_params
        params.require(:chat).permit(:message, :room_id)
    end
    
end
