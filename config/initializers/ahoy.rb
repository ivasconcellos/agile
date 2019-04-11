class Ahoy::Store < Ahoy::DatabaseStore

	def track_event(data)
    data[:usuario_id] = @visit.usuario_id
    super(data)
end
end

# set to true for JavaScript tracking
Ahoy.api = false

# better user agent parsing
Ahoy.user_agent_parser = :device_detector

# better bot detection
Ahoy.bot_detection_version = 2
