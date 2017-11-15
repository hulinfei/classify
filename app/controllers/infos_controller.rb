class InfosController < BaseController
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
  end

  def show
  end

  def new
    @info_types = Category.find(params[:category_id]).info_class.info_types
    @info = Category.find(params[:category_id]).infos.new
  end

  def edit
  end

  def create
    # info_p = info_params
    # @info_types = Category.find(params[:category_id]).info_class.info_types
    #  @info_types.each do |info_type|
    #   info_p.permit(info_type.fieldname.to_sym)
    #  end
    ActionController::Parameters.permit_all_parameters = true

    @info = Category.find(params[:category_id]).infos.new(params.require(:info).permit!)

    respond_to do |format|
      if @info.save
        format.html { redirect_to infos_path, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @info }
      else
        format.html { render :new }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @info.update(info_params)
        format.html { redirect_to infos_path, notice: 'Info was successfully updated.' }
        format.json { render :show, status: :ok, location: @info }
      else
        format.html { render :edit }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
      params.require(:info).permit(:title, :phone, :description , :view, :status, :category_id)
    end
end
