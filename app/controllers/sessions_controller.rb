class SessionsController < Clearance::SessionsController


  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:new]
    skip_before_action :require_login,
      only: [:create, :new, :destroy],
      raise: false
    skip_before_action :authorize,
      only: [:create, :new, :destroy],
      raise: false
  else
    before_filter :redirect_signed_in_users, only: [:new]
    skip_before_filter :require_login,
      only: [:create, :new, :destroy],
      raise: false
    skip_before_filter :authorize,
      only: [:create, :new, :destroy],
      raise: false
  end

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        flash.now.notice = status.failure_message
        render template: "home/index"
      end
    end
  end

  def create_from_omniauth
        # byebug
        auth_hash = request.env["omniauth.auth"]

        authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
        if authentication.user
          user = authentication.user
          authentication.update_token(auth_hash)
          @next = root_url
          @notice = "Signed in!"
        else
          user = User.create_with_auth_and_hash(authentication,auth_hash)
          # @next = edit_user_path(user)
          @notice = "User created - confirm or edit details..."
        end
        sign_in(user)
        redirect_to '/user', :notice => @notice
   end



  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def url_after_destroy
    # byebug
    root_path
  end
end

