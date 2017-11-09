class BannarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bannar, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /bannars
  # GET /bannars.json
  def index
    @bannars = Bannar.all.page params[:page]
  end

  # GET /bannars/1
  # GET /bannars/1.json
  def show
  end

  # GET /bannars/new
  def new
    @bannar = Site.find_by(user_id: current_user).bannars.build
  end

  # GET /bannars/1/edit
  def edit
  end

  # POST /bannars
  # POST /bannars.json
  def create
    @bannar = Site.find_by(user_id: current_user).bannars.build(bannar_params)

    respond_to do |format|
      if @bannar.save
        format.html { redirect_to @bannar, notice: 'Bannar was successfully created.' }
        format.json { render :show, status: :created, location: @bannar }
      else
        format.html { render :new }
        format.json { render json: @bannar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bannars/1
  # PATCH/PUT /bannars/1.json
  def update
    respond_to do |format|
      if @bannar.update(bannar_params)
        format.html { redirect_to @bannar, notice: 'Bannar was successfully updated.' }
        format.json { render :show, status: :ok, location: @bannar }
      else
        format.html { render :edit }
        format.json { render json: @bannar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bannars/1
  # DELETE /bannars/1.json
  def destroy
    @bannar.destroy
    respond_to do |format|
      format.html { redirect_to bannars_url, notice: 'Bannar was successfully destroyed.' }
      format.json { head :no_content }
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
