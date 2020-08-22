class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # chatroom = Chatroom.find(params[:id])
    # stream_for chatroom # generate a unique name  for a specific chatroom

    stream_for "general"
  end

  # def unsubscribed #leave the channel
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
