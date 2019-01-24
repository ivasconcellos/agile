module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_usuario

    def connect
      self.current_usuario = find_verified_usuario
      logger.add_tags 'ActionCable', current_usuario.email
    end

    protected

    def find_verified_usuario # this checks whether a user is authenticated with devise
      if verified_usuario = env['warden'].usuario
        verified_usuario
      else
        reject_unauthorized_connection
      end
    end
  end
end
