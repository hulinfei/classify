class CountsController < BaseController

  def index
      @wx_counts = @current_site.wx_users_count
      @bannars_counts = @current_site.bannars_count
      @infos_counts = 0
      @current_site.wx_users.each do |wx_user|
       	@infos_counts = @infos_counts + wx_user.infos.count
      end
  end

end
