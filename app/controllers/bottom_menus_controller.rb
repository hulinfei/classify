class BottomMenusController < BaseController
  before_action :set_bottom_menu, only: [:show, :edit, :update, :destroy, :up, :down]

  # GET /bottom_menus
  # GET /bottom_menus.json
  def index
    @bottom_menus = @current_site.bottom_menus.all.page params[:page]
    @bottom_menus = @bottom_menus.order_by(created_at: :desc, position: :asc)
  end

  # GET /bottom_menus/1
  # GET /bottom_menus/1.json
  def show
  end

  # GET /bottom_menus/new
  def new
    @bottom_menu = @current_site.bottom_menus.build
  end

  # GET /bottom_menus/1/edit
  def edit
  end

  def up
    @bottom_menu.move_higher!
    redirect_to bottom_menus_path
  end

  def down
    @bottom_menu.move_lower!
    redirect_to bottom_menus_path
  end


  # POST /bottom_menus
  # POST /bottom_menus.json
  def create
    @bottom_menu = @current_site.bottom_menus.build(bottom_menu_params)

    respond_to do |format|
      if @bottom_menu.save
        format.html { redirect_to bottom_menus_path, notice: 'Bottom menu was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /bottom_menus/1
  # PATCH/PUT /bottom_menus/1.json
  def update
    respond_to do |format|
      if @bottom_menu.update(bottom_menu_params)
        format.html { redirect_to bottom_menus_path, notice: 'Bottom menu was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /bottom_menus/1
  # DELETE /bottom_menus/1.json
  def destroy
    @bottom_menu.destroy
    respond_to do |format|
      format.html { redirect_to bottom_menus_url, notice: 'Bottom menu was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bottom_menu
      @bottom_menu = BottomMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bottom_menu_params
      params.require(:bottom_menu).permit(:name, :icon, :url, :active_icon)
    end
end
