class UsersController < BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.role == "super"
      @users = User.all.page params[:page]
    else
      @users = User.where(id: current_user.id).page params[:page]
    end
  end

  def show
  end

  def new
    @user = @current_site.users.new
  end

  def edit
  end

  def create
    @user = @current_site.users.new(user_params)
    if current_user.role != "super" && @user.role == "super"
      @user = @user.delete(:role)
      redirect_to users_path, notice: '用户没有权限'
      return
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      user_p = user_params.to_h
      user_p = user_p.delete(:role) if current_user == @user
      if @user.update(user_p)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end
end
