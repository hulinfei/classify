class Api::V1::BaseController < ActionController::API

  before_action :set_current_site

  before_action :set_current_wx_user

  private

  def set_current_site
  	domain = request.domain
  	@current_site = Site.find_by(domain: domain)
  	if @current_site.nil?
  		render json: { status: '-100', notice: '对不起你访问的站点不存在' }
  	end
  end

  def set_current_wx_user

  end
end
