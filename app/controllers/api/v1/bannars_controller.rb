class Api::V1::BannarsController <  Api::V1::BaseController

  # GET /bannars
  # GET /bannars.json
  def index
    @bannars = @current_site.bannars.actived.not_expired
  end
end