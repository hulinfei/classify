class InfosController < BaseController
  after_action :update_photo, only: [:create, :update]
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @infos = Info.all
    @categories = Category.all
    @infos = @infos.where(category_id: params[:id]) unless params[:category_id].blank? 
    if params[:category_id]
      @infos = @infos.where(category_id: params[:category_id])
      @info_types = Category.find(params[:category_id]).info_class.info_types
    end
    @infos = @infos.page params[:page]
    @infos = @infos.order_by(top: :desc, created_at: :desc )
  end

  def show
    @info_types = @info.info_types
    puts "======================="
    puts @info_types
    @info.view = $redis.incr("info:#{@info.id.to_s}:view")
    @info.save
    @photos = @info.photos
  end

  def new
    @info_types = Category.find(params[:category_id]).info_class.info_types
    @info = Category.find(params[:category_id]).infos.new
    @photo = Photo.new
    # 生成一个随机数
    $rand = ['a'..'z','0'..'9',*'A'..'Z'].sample(16).join
  end

  def edit
    @info_types = @info.info_types
    @photo = @info.photos.new
    # 生成一个随机数
    $rand = ['a'..'z','0'..'9',*'A'..'Z'].sample(16).join
  end

  def top
    @info.update(top: true)
    redirect_to infos_path(category_id: params[:category_id])
  end

  def off_top
   @info.update(top: false)
    redirect_to infos_path(category_id: params[:category_id])
  end

  def create
    # info_p = info_params
    # @info_types = Category.find(params[:category_id]).info_class.info_types
    #  @info_types.each do |info_type|
    #   info_p.permit(info_type.fieldname.to_sym)
    #  end
    # ActionController::Parameters.permit_all_parameters = true

    @info = Category.find(params[:category_id]).infos.new(params.require(:info).permit!)

    respond_to do |format|
      if @info.save
        @info.info_types << Category.find(params[:category_id]).info_class.info_types
        @info.update(wx_user_id: WxUser.first.id)

        format.html { redirect_to infos_path(category_id: params[:category_id]), notice: 'Info was successfully created.' }
      else
        @info_types = Category.find(params[:category_id]).info_class.info_types
        @photo = Photo.new
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @info.update(params.require(:info).permit!)
        format.html { redirect_to infos_path(category_id: params[:category_id]), notice: 'Info was successfully updated.' }
      else
        @info_types = @info.info_types
        @photo = @info.photos.new
        format.html { render :edit }
      end
    end
  end

  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Info was successfully destroyed.' }
    end
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def update_photo
        Photo.where(random_number: $rand).update_all(info_id: @info.id)
    end

    def info_params
      params.require(:info).permit(:title, :phone, :description, :details, :address, :view, :status, :category_id)
    end
end
