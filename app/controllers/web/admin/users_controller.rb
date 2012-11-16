class Web::Admin::UsersController < Web::Admin::ProtectedApplicationController
  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = User.ransack(params[:search])
    @users = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = flash_translate(:success)
      redirect_to edit_admin_user_path(@user)
    else
      render :action => :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = flash_translate(:success)
      redirect_to edit_admin_user_path(@user)
    else
      render :action => :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = flash_translate(:success)
    redirect_to admin_users_path
  end

  def show
    redirect_to edit_admin_user_path(params[:id])
  end

end
