class Ahoy::Store < Ahoy::DatabaseStore

    def track_event(data)
        if @visit
            data[:usuario_id] = @visit.usuario_id
        end
        if @user
            data[:curso_id] = @user.curso_atual_id
        end
        super(data)
    end
end

# set to true for JavaScript tracking
Ahoy.api = false

# better user agent parsing
Ahoy.user_agent_parser = :device_detector

# better bot detection
Ahoy.bot_detection_version = 2
