class CountsController < BaseController

  def index
      @wx_counts = @current_site.wx_users_count
      @bannars_counts = @current_site.bannars_count
  end

end
