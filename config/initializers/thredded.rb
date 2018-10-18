# frozen_string_literal: true

# Thredded configuration

# ==> usuario Configuration
# The name of the class your app uses for your usuarios.
# By default the engine will use 'usuario' but if you have another name
# for your usuario class - change it here.
Thredded.user_class =  'Usuario'

# usuario name column, used in @mention syntax and *must* be unique.
# This is the column used to search for usuarios' names if/when someone is @ mentioned.
Thredded.user_name_column = :nome

# usuario display name method, by default thredded uses the user_name_column defined above
# You may want to use :to_s or some more elaborate method
# Thredded.usuario_display_name_method = :to_s

# The path (or URL) you will use to link to your usuarios' profiles.
# When linking to a usuario, Thredded will use this lambda to spit out
# the path or url to your usuario. This lambda is evaluated in the view context.
# If the lambda returns nil, a span element is returned instead of a link; so
# setting this to always return nil effectively disables all usuario links.
Thredded.user_path = ->(usuario) {
  user_path = :"#{Thredded.user_class_name.demodulize.underscore}_path"
  main_app.respond_to?(user_path) ? main_app.send(user_path, usuario) : "/usuarios/#{usuario.to_param}"
}

# This method is used by Thredded controllers and views to fetch the currently signed-in usuario
Thredded.current_user_method = :"current_#{Thredded.user_class_name.demodulize.underscore}"

# usuario avatar URL. rb-gravatar gem is used by default:
Thredded.avatar_url = ->(usuario) { Gravatar.src(usuario.email, 156, 'mm') }

# ==> Permissions Configuration
# By default, thredded uses a simple permission model, where all the usuarios can post to all message boards,
# and admins and moderators are determined by a flag on the usuarios table.

# The name of the moderator flag column on the usuarios table.
Thredded.moderator_column = :perfil
# The name of the admin flag column on the usuarios table.
Thredded.admin_column = :perfil

# Whether posts and topics pending moderation are visible to regular usuarios.
Thredded.content_visible_while_pending_moderation = true

# This model can be customized further by overriding a handful of methods on the usuario model.
# For more information, see app/models/thredded/usuario_extender.rb.

# ==> UI configuration

# How to calculate the position of messageboards in a list:
# :position            (default) set the position manually (new messageboards go to the bottom, by creation timestamp)
# :last_post_at_desc   most recent post first
# :topics_count_desc   most topics first
Thredded.messageboards_order = :position

# Whether usuarios that are following a topic are listed on the topic page.
Thredded.show_topic_followers = false

# Whether the list of usuarios who are currently online is displayed.
Thredded.currently_online_enabled = true

# Whether private messaging functionality is enabled.
Thredded.private_messaging_enabled = true

# The number of topics to display per page.
# Thredded.topics_per_page = 50

# The number of posts to display per page in a topic.
# Thredded.posts_per_page = 25

# The layout for rendering Thredded views.
Thredded.layout = 'thredded/application'

# ==> Email Configuration
# Email "From:" field will use the following
# Thredded.email_from = 'no-reply@example.com'

# Emails going out will prefix the "Subject:" with the following string
# Thredded.email_outgoing_prefix = '[My Forum] '
#
# The parent mailer for all Thredded mailers
# Thredded.parent_mailer = 'ActionMailer::Base'

# ==> Model configuration
# The range of valid messageboard name lengths. Default:
# Thredded.messageboard_name_length_range = (1..60)
#
# The range of valid topic title lengths. Default:
# Thredded.topic_title_length_range = (1..200)

# ==> Routes and URLs
# How Thredded generates URL slugs from text:

# Default:
# Thredded.slugifier = ->(input) { input.parameterize }

# If your forum is in a language other than English, you might want to use the babosa gem instead
# Thredded.slugifier = ->(input) { Babosa::Identifier.new(input).normalize.transliterate(:russian).to_s }

# By default, thredded uses integers for record ID route constraints.
# For integer based IDs (default):
# Thredded.routes_id_constraint = /[1-9]\d*/
#
# For UUID based IDs (example):
# Thredded.routes_id_constraint = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

# ==> Post Content Formatting
# Customize the way Thredded handles post formatting.

# ===> Emoji using the 'gemoji' gem
# 1. Install `gemoji` following instruction at https://github.com/github/gemoji.
# 2. Uncomment the following line:
# Thredded::ContentFormatter.after_markup_filters.insert(1, HTML::Pipeline::EmojiFilter)

# Change the HTML sanitization settings used by Thredded.
# See the Sanitize docs for more information on the underlying library: https://github.com/rgrove/sanitize/#readme
# E.g. to allow a custom element <custom-element>:
# Thredded::ContentFormatter.whitelist[:elements] += %w(custom-element)

# ==> usuario autocompletion (Private messages and @-mentions)
# Thredded.autocomplete_min_length = 2 lower to 1 if have 1-letter names -- increase if you want

# ==> Error Handling
# By default Thredded just renders a flash alert on errors such as Topic not found, or Login required.
# Below is an example of overriding the default behavior on LoginRequired:
#
# Rails.application.config.to_prepare do
#   Thredded::ApplicationController.module_eval do
#     rescue_from Thredded::Errors::LoginRequired do |exception|
#       @message = exception.message
#       render template: 'sessions/new', status: :forbidden
#     end
#   end
# end

# ==> View hooks
#
# Customize the UI before/after/replacing individual components.
# See the full list of view hooks and their arguments by running:
#
#     $ grep view_hooks -R --include '*.html.erb' "$(bundle show thredded)"
#
# Rails.application.config.to_prepare do
#   Thredded.view_hooks.post_form.content_text_area.config.before do |form:, **args|
#     # This is called in the Thredded view context, so all Thredded helpers and URLs are accessible here directly.
#     'hi'
#   end
# end

# ==> Topic following
#
# By default, a usuario will be subscribed to a topic they've created. Uncomment this to not subscribe them:
#
# Thredded.auto_follow_when_creating_topic = false
#
# By default, a usuario will be subscribed to (follow) a topic they post in. Uncomment this to not subscribe them:
#
# Thredded.auto_follow_when_posting_in_topic = false
#
# By default, a usuario will be subscribed to the topic they get @-mentioned in.
# Individual usuarios can disable this in the Notification Settings.
# To change the default for all usuarios, simply change the default value of the `follow_topics_on_mention` column
# of the `thredded_usuario_preferences` and `thredded_usuario_messageboard_preferences` tables.

# ==> Notifiers
#
# Change how usuarios can choose to be notified, by adding notifiers here, or removing the initializer altogether
#
# default:
# Thredded.notifiers = [Thredded::EmailNotifier.new]
#
# none:
# Thredded.notifiers = []
#
# add in (must install separate gem (under development) as well):
# Thredded.notifiers = [Thredded::EmailNotifier.new, Thredded::PushoverNotifier.new(ENV['PUSHOVER_APP_ID'])]
