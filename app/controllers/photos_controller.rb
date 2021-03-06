class PhotosController <  BaseController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all.page params[:page]
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new()
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    params[:photo][:img].each do |photo|

      @params = {}
      @params['img'] = photo
      @params['random_number'] = params[:photo][:random_number]
      @photo = Photo.new(@params)
      @photo.save
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photos_path, notice: 'Photo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Photo was successfully destroyed.' }
      end
  end
  # 用做info edit页面删除图片
  def del
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:img, :random_number, :info_id)
    end
end
