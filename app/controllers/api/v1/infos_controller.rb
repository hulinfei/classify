class Api::V1::InfosController <  Api::V1::BaseController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
  	@info_types = Category.find(params[:category_id]).info_class.info_types
    @infos = Info.all
    @infos = @infos.where(category_id: params[:category_id]) if params[:category_id]
    @infos = @infos.page(params[:page]).per(2)
    @page = @infos.next_page
  end

  def show
    @info_types = @info.info_types
    @info.view = $redis.incr("info:#{@info.id.to_s}:view")
    @info.save
    @photos = @info.photos
    # 获取用户IP 存入redis
    ip = request.env['HTTP_X_REAL_IP']
    @info.inc_viewer(ip)
  end

  def hot
    @infos = Info.all.order_by(view: :desc).limit(5)
  end

  def top
    @infos = Info.where(top: true).order_by(created_at: :desc)
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
      params.require(:info).permit(:title, :phone, :description, :details, :address, :view, :status, :category_id)
    end
end