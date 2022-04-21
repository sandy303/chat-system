class Message < ApplicationRecord


    belongs_to :conversation
    belongs_to :user

    validate_presence_of :body, :conversation_id, :user_id

    # Shows time of each message in the conversation
    def message_time
        created_at.strftime("%d/%m/%y at %l:%M %p")
    end


end
m