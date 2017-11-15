class InfoTypesController < BaseController
  before_action :set_info_type, only: [:show, :edit, :update, :destroy]

  def index
    @info_types = InfoType.all.page params[:page]
  end

  def show
  end

  def new
    @info_type = InfoType.new#current_info_type.info_types.build
  end

  def edit
  end

  def create
    @info_type = InfoType.new(info_type_params)

    respond_to do |format|
      if @info_type.save
        format.html { redirect_to @info_type, notice: 'InfoType was successfully created.' }
        format.json { render :show, status: :created, location: @info_type }
      else
        format.html { render :new }
        format.json { render json: @info_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @info_type.update(info_type_params)
        format.html { redirect_to @info_type, notice: 'InfoType was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_type }
      else
        format.html { render :edit }
        format.json { render json: @info_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @info_type.destroy
    respond_to do |format|
      format.html { redirect_to info_types_url, notice: 'InfoType was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_info_type
      @info_type = InfoType.find(params[:id])
    end

    def info_type_params
      params.require(:info_type).permit(:name, :fieldname, :fieldtype, :optype, :validation_rule, :show, :info_class_id)
    end
end
