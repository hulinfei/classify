class Api::V1::InfosController <  Api::V1::BaseController


  def index
  	@info_types = Category.find(params[:category_id]).info_class.info_types
    @infos = Info.all
    @infos = @infos.where(category_id: params[:category_id]) if params[:category_id]
    @infos = @infos.page(params[:page]).per(2)
    @page = @infos.next_page
  end

  def hot
    @infos = Info.all.order_by(view: :desc).limit(5)
  end

  def top
    @infos = Info.where(top: true).order_by(created_at: :desc)
  end
end