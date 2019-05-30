class BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped
  def index
    skip_authorization

  end
  def traveller_info
  end

end
