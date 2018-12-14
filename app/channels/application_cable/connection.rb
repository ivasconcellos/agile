module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_usuario

    def connect
      self.current_usuario = find_verified_user
      logger.add_tags 'ActionCable', current_usuario.email
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      if verified_user = env['warden'].usuario
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end