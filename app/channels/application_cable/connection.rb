module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_ip

    def connect
      self.current_ip = request.remote_ip
    end
  end
end
