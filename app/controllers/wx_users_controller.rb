class WxUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wx_user, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  def index
    @wx_users = WxUser.all.page params[:page]
  end

  def show
  end

  def new
    @wx_user = WxUser.new#current_wx_user.wx_users.build
  end

  def edit
  end

  def create
    @wx_user = WxUser.new(wx_user_params)

    respond_to do |format|
      if @wx_user.save
        format.html { redirect_to @wx_user, notice: 'WxUser was successfully created.' }
        format.json { render :show, status: :created, location: @wx_user }
      else
        format.html { render :new }
        format.json { render json: @wx_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @wx_user.update(wx_user_params)
        format.html { redirect_to @wx_user, notice: 'WxUser was successfully updated.' }
        format.json { render :show, status: :ok, location: @wx_user }
      else
        format.html { render :edit }
        format.json { render json: @wx_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wx_user.destroy
    respond_to do |format|
      format.html { redirect_to wx_users_url, notice: 'WxUser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_wx_user
      @wx_user = WxUser.find(params[:id])
    end

    def wx_user_params
      params.require(:wx_user).permit(:nickname, :openid, :avatar)
    end
end
