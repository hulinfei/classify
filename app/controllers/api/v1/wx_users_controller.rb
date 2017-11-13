class Api::V1::WxUsersController <  Api::V1::BaseController


  def index
    @wx_users = @current_site.wx_users
  end
end