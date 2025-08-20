module Admin
  class ApplicationController < ::ApplicationController
    layout "admin"

    include Authentication
  end
end
