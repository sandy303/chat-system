class ConversationsController < ApplicationController
    before_action :authenticate_user!

    # shows all conversations and users at index page  
    def index
        @users = User.all
        @conversation =  Conversation.all
    end

    def create
        # if the conversation is already exists
        if Conversation.between(params[:sender_id],params[:reciepient_id]).present?
            @conversation = Conversation.between(params[:sender_id],params[:reciepient_id]).first

        # create new one    
        else
            @conversation = Conversation.create!(conversation_params)
            @user = User.find(params[:user_id])
            @user.increment_chats
        end

        # in both cases redirect to that conversation
        redirect_to conversation_messages_path(@conversation)
    end

   # search conversation body
   def conversation_search1(word)
        @search_suggestion = SearchSuggestion.find_by(term: @word.title.downcase)
        if @search_suggestion.present?
           @search_suggestion.increment!(:items_count)
        end  
   end

    private
    def conversation_params
        params.permit(:sender_id, :reciepient_id)
    end

    # Search for word in a conversation
    def conversation_search2
        return @founded =  Conversations.search((params[:q].present ? params[:q] : '*' )).records
    end

end