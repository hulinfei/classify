class WxUsersController < BaseController
  before_action :set_wx_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.role == "admin"
      @wx_users = WxUser.all.page params[:page]
    else
      @wx_users = @current_site.wx_users.all.page params[:page]
      @wx_users = WxUser.full_text_search(params[:name]) unless params[:name].blank?
      @wx_users = @wx_users.page params[:page]
    end
  end

  def show
  end

  def new
    @wx_user = @current_site.wx_users.new
  end

  def edit
  end

  def create
    @wx_user = @current_site.wx_users.new(wx_user_params)

    respond_to do |format|
      if @wx_user.save
        format.html { redirect_to @wx_user, notice: 'WxUser was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @wx_user.update(wx_user_params)
        format.html { redirect_to @wx_user, notice: 'WxUser was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @wx_user.destroy
    respond_to do |format|
      format.html { redirect_to wx_users_url, notice: 'WxUser was successfully destroyed.' }
    end
  end

  private
    def set_wx_user
      @wx_user = WxUser.find(params[:id])
    end

    def wx_user_params
      params.require(:wx_user).permit(:subscribe, :openid, :nickname, :sex, :language, :city, :province, :country, :headimgurl, :subscribe_time, :unsubscribe_time, :unionid, :remark, :groupid, :tagid_list)
    end
end
