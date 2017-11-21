class BannarsController <  BaseController
  before_action :set_bannar, only: [:show, :edit, :update, :destroy, :up, :down]

  # GET /bannars
  # GET /bannars.json
  def index
    @bannars = @current_site.bannars.page params[:page]
    @bannars = @bannars.order_by(active: :desc, position: :asc)
  end

  # GET /bannars/1
  # GET /bannars/1.json
  def show
  end

  # GET /bannars/new
  def new
    @bannar = @current_site.bannars.build
  end

  # GET /bannars/1/edit
  def edit
  end

  def up
    @bannar.move_higher!
    redirect_to bannars_path
  end

  def down
    @bannar.move_lower!
    redirect_to bannars_path
  end

  # POST /bannars
  # POST /bannars.json
  def create
    @bannar = @current_site.bannars.build(bannar_params)

    respond_to do |format|
      if @bannar.save
        format.html { redirect_to bannars_path, notice: 'Bannar was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /bannars/1
  # PATCH/PUT /bannars/1.json
  def update
    respond_to do |format|
      if @bannar.update(bannar_params)
        format.html { redirect_to bannars_path, notice: 'Bannar was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /bannars/1
  # DELETE /bannars/1.json
  def destroy
    @bannar.destroy
    respond_to do |format|
      format.html { redirect_to bannars_url, notice: 'Bannar was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bannar
      @bannar = Bannar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bannar_params
      params.require(:bannar).permit(:title, :url, :active, :avatar, :end_time)
    end
end
