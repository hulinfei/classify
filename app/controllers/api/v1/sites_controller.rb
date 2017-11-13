class Api::V1::SitesController <  Api::V1::BaseController

  def index
   @site = @current_site
  end
end