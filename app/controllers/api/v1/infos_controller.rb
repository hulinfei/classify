class Api::V1::InfosController <  Api::V1::BaseController


  def index
    @infos = Info.all
     @info_types = Category.find(params[:category_id]).info_class.info_types
    if params[:category_id]
      @infos = @infos.where(category_id: params[:category_id])
     
    end
 end
end