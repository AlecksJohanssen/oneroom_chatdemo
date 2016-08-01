# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def test(data)
    ActionCable.server.broadcast('messages', message: "Test: #{data}")
  end

  def create(data)
    message = Message.create(content: data["message"])
    ActionCable.server.broadcast('messages', action: 'append', data: render_message(message))
  end

  def destroy(data)
    Rails.logger.info "data: #{data}"
    message = Message.find(data["id"]).destroy
    ActionCable.server.broadcast 'messages', action: 'remove', data: "#message_#{message.id}"
  end

  private
  def render_message(message)
    ApplicationController.render(
      partial: 'messages/message',
      locals: {message: message}
    )
  end
end
