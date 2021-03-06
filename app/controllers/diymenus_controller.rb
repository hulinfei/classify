class DiymenusController < BaseController
  before_action :set_diymenu, only: [:show, :edit, :update, :destroy]

  # GET /diymenus
  # GET /diymenus.json
  def index
    @diymenus = @current_site.diymenus.all
  end

  # GET /diymenus/1
  # GET /diymenus/1.json
  def show
  end

  def sync
    menu = Diymenu.build_menu(@current_site)
    redirect_to diymenus_path
  end

  # GET /diymenus/new
  def new
    @diymenu = @current_site.diymenus.new
  end

  # GET /diymenus/1/edit
  def edit
  end

  # POST /diymenus
  # POST /diymenus.json
  def create
    @diymenu = @current_site.diymenus.new(diymenu_params)

    respond_to do |format|
      if @diymenu.save
        format.html { redirect_to diymenus_path, notice: 'Diymenu was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /diymenus/1
  # PATCH/PUT /diymenus/1.json
  def update
    respond_to do |format|
      if @diymenu.update(diymenu_params)
        format.html { redirect_to diymenus_path, notice: 'Diymenu was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /diymenus/1
  # DELETE /diymenus/1.json
  def destroy
    @diymenu.destroy
    respond_to do |format|
      format.html { redirect_to diymenus_url, notice: 'Diymenu was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diymenu
      @diymenu = Diymenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diymenu_params
      params.require(:diymenu).permit(:name, :key, :url, :is_show, :parent_id ,:parent_ids)
    end
  end
