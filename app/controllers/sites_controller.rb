class SitesController < BaseController
  before_action :set_site, only: [:show, :edit, :update, :destroy]


  # GET /sites
  # GET /sites.json
  def index
    if can? :manage, Site
    @sites = Site.all.page params[:page]
    elsif can? :update, Site
      @sites = Site.where(id: current_user.site_id).page params[:page]
   end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
     if can? :manage, Site
    @site = Site.new
    end
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = current_user.sites.build(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to sites_path, notice: 'Site was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to sites_path, notice: 'Site was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :domain, :weixin_appid, :weixin_appsecret, :weixin_secret_key, :weixin_token, :logo, :qr, :subscribe_text)
    end
end
