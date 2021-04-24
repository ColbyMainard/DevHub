RailsAdmin.config do |config|

  ### Popular gems integration
  config.main_app_name = "DevHub"
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      user = User.where(username: username).first
      user.authenticate(password) if user
    end
  end

  config.authorize_with do |controller|
    if User.nil?
      redirect_to main_app.root_path, flash: {error: 'Please Login to Continue..'}
    elsif !User.admin?
      redirect_to main_app.root_path, flash: {error: 'You are not Admin!'}
    end
  end


  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  config.authorize_with do |contoller|
    redirect_to main_app.root_path unless User.try(:admin?)
  end

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
end
