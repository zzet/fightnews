class Web::Admin::PostsController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_posts_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = Post.ransack(params[:search])
    @posts = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @post = Post.new
    add_i18n_breadcrumb :new, :new_admin_post_path
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_post_path
      render :action => :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    add_breadcrumb @post, :edit_admin_post_path
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @post, :edit_admin_post_path
      render :action => :edit
    end

  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
