class Api::V1::InfosController <  Api::V1::BaseController


  def index
  	@info_types = Category.find(params[:category_id]).info_class.info_types
    @infos = Info.all
    @infos = @infos.where(category_id: params[:category_id]) if params[:category_id]
    @infos = @infos.page(params[:page]).per(2)
    @page = @infos.next_page
 end
end