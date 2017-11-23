class InfosController < BaseController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @infos = Info.all
    @categories = Category.all
    @infos = Info.full_text_search(params[:search]) unless params[:search].blank?
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
    @info.view = $redis.incr("info:#{@info.id.to_s}:view")
    @info.save
    @photos = @info.photos.all
  end

  def new
    @info_types = Category.find(params[:category_id]).info_class.info_types
    @info = Category.find(params[:category_id]).infos.new
    @photo = @info.photos.build
  end

  def edit
    @info_types = @info.info_types
    @photo = @info.photos.build
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

    @info = Category.find(params[:category_id]).infos.new(params.require(:info).permit!)

    respond_to do |format|
      if @info.save
        params[:photos]['img'].each do |i|
          @photo = @info.photos.create!(:img => i)
        end
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
        if not params[:photos].blank?
          params[:photos]['img'].each do |i|
            @photo = @info.photos.create!(:img => i)
          end
        end
        format.html { redirect_to infos_path(category_id: params[:category_id]), notice: 'Info was successfully updated.' }
      else
        @info_types = @info.info_types
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

    def info_params
      params.require(:info).permit(:title, :phone, :description, :details, :address, :view, :status, :category_id, photos_attributes: [:id, :info_id, :img])
    end
end
