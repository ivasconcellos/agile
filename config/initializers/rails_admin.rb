RailsAdmin.config do |config|
  config.main_app_name = ["AGILE"]
 
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Usuario' do
    exclude_fields :id, :created_at, :updated_at, :sign_in_count,
                   :current_sign_in_at, :last_sign_in_at,
                   :current_sign_in_ip,
                   :last_sign_in_ip, :remember_created_at,
                   :reset_password_sent_at, :confirmation_token, :confirmed_at,
                   :confirmation_sent_at
  
    field :perfil, :enum do
      enum { Usuario::PERFIL }
    end
  end
end
