class BaseController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_current_site
  load_and_authorize_resource
  private

  def set_current_site
    @current_site = current_user.site
  end

end
