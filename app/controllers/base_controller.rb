class BaseController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_current_site

  private

  def set_current_site
    @current_site = Site.find_by(user: current_user)
  end

end
