class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  @@chat_count = 1
  @@name = ""

  def increment_chats
    @@chat_count += 1
  end

  # defining class method
  def self.get_chat_count
      return  @@chat_count
  end

end
