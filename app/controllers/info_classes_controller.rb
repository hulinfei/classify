class InfoClassesController < BaseController
  before_action :set_info_class, only: [:show, :edit, :update, :destroy]

  def index
    @info_classes = InfoClass.all.page params[:page]
  end

  def show
  end

  def new
    @info_class = InfoClass.new#current_info_class.info_classes.build
  end

  def edit
  end

  def create
    @info_class = InfoClass.new(info_class_params)

    respond_to do |format|
      if @info_class.save
        format.html { redirect_to @info_class, notice: 'InfoClass was successfully created.' }
        format.json { render :show, status: :created, location: @info_class }
      else
        format.html { render :new }
        format.json { render json: @info_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @info_class.update(info_class_params)
        format.html { redirect_to @info_class, notice: 'InfoClass was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_class }
      else
        format.html { render :edit }
        format.json { render json: @info_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @info_class.destroy
    respond_to do |format|
      format.html { redirect_to info_classes_url, notice: 'InfoClass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_info_class
      @info_class = InfoClass.find(params[:id])
    end

    def info_class_params
      params.require(:info_class).permit(:name)
    end
end
