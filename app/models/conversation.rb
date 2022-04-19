class Conversation < ActiveRecord::Base
    belongs_to :sender, :foreign_key => :sender_id, class_name:  'User'
    belongs_to :reciepient, :foreign_key => :reciepient_id, class_name:  'User'

    has_many :messages, dependent: :destroy
    validate_uniqueness_of :sender_id, :scope :reciepient_id
    
    validate_uniqueness_of :name

    @@messages_count = 1
   
    scope :between, -> (sender_id, reciepient_id) do
        where ("conversation.sender_id = ? AND conversation.reciepient_id = ?)
        OR (conversation.sender_id = ? AND conversation.reciepient_id = ?)",
        sender_id, reciepient_id, reciepient_id, sender_id)
    end

    def increment_messages
        @@messages_count += 1
    end

    # defining class method
    def self.get_message_count
        return  @@messages_count
    end

end