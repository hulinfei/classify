class Api::V1::BaseController < ActionController::API

  before_action :set_current_site

  before_action :set_current_wx_user

  private

  def set_current_site
  	domain = request.host
    if Rails.env.development?
      @current_site = Site.first
    else
      @current_site = Site.find_by(domain: domain)
      puts @current_site
      if @current_site.nil?
        render json: { status: '-100', notice: '对不起你访问的站点不存在' }
      end
    end

  end

  def set_current_wx_user

  end
end
