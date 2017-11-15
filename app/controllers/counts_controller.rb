class CountsController < BaseController

  def index
      @wx_counts = @current_site.wx_users_count
  end

end
