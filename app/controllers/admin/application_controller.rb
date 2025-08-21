module Admin
  class ApplicationController < ::ApplicationController
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    layout "admin"

    include Authentication
    include Pundit::Authorization

    def pundit_user
      Current.user
    end

    private

    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore

      flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_back_or_to(root_path)
    end
  end
end
