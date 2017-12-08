class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :admin_user, only: :destroy
  before_action :find_user, except: %i(index new create)

  def index
    @users = User.order_user.search_by_name(params[:search]).paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "form.sign_up_succ"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "form.update_succ"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "form.del_succ"
    else
      flash[:danger] = t "form.del_error"
    end
    redirect_to users_url
  end

  def following
    @title = t "form.following"
    @user  = User.find_by id: params[:id]
    if @user
      @users = @user.following.paginate page: params[:page]
      render :show_follow
    else
      redirect_to users_url
    end
  end

  def followers
    @title = t "form.followers"
    @user  = User.find_by id: params[:id]
    if @user
      @users = @user.followers.paginate page: params[:page]
      render :show_follow
    else
      redirect_to users_url
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "form.user_error"
    redirect_to signup_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :is_admin, :avatar_img
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "form.pl_login"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.is_admin?
  end
end
