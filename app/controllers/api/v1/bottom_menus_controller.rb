class Api::V1::BottomMenusController <  Api::V1::BaseController

  def index
    @bottom_menus = @current_site.bottom_menus.page params[:page]
  end
end