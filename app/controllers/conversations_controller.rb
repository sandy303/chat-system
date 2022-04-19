class ConversationsController < ActiveController
    before_action :authenticate_user!

    # shows all conversations and users at index page  
    def index
        @users = User.all
        @conversations =  Conversation.all
    end

    def create
        # if the conversation is already exists
        if Conversation.between(params[:sender_id],params[:reciepient_id]).present?
            @conversation = Conversation.between(params[:sender_id],params[:reciepient_id]).first

        # create new one    
        else
            @conversation = Conversation.create!(conversation_Params)
            @user = User.find(params[:user_id])
            @chat_count =  @user.increment(:chat_count) 
            @user.chat_count = @chat_count
        end

        # in both cases redirect to that conversation
        redirect_to conversation_messages_path(@conversation)
    end

   # search conversation body
   def conversation_search
        @search_suggestion = SearchSuggestion.find_by(term: @item.title.downcase)
        if @search_suggestion.present?
           @search_suggestion.increment!(:items_count)
        end  
   end

    private
    def conversation_params
        params.permit(:sender_id, :reciepient_id)
    end

end