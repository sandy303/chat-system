class MessagesController < ActiveController

    before_action do
        @conversation = Coneversation.find(params[:conversation_id])
    end
    
    # get messages of this convesrsation
    def index
        @messages = @conversation.messages
        @conversation.messages_count = @messages
        @message = @conversation.messages.new
    end

    def new
        @message = @conversation.messages.new
    end

    def create
        @message = @conversation.messages.new(message_params)
        
        #redirect to the conversation
        if @message.save
            redirect_to conversation_messages_path(@coneversation)
        end    
    end

    private 
    def message_params
        params.require(:message).permit(:body, :user_id)
    end
end