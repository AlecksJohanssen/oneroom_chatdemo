class CreateMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    sleep 3
    Rails.logger.info "broadcasting: #{args.inspect}"
    ActionCable.server.broadcast *args
  end
end
