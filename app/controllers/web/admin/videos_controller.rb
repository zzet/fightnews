class Web::Admin::VideosController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_videos_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = Video.ransack(params[:search])
    @videos = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @video = Video.new
    add_i18n_breadcrumb :new, :new_admin_video_path
  end

  def create
    @video = Video.new(params[:video])

    if @video.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_video_path
      render :action => :new
    end
  end

  def edit
    @video = Video.find(params[:id])
    add_breadcrumb @video, :edit_admin_video_path
  end

  def update
    @video = Video.find(params[:id])

    if @video.update_attributes(params[:video])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @video, :edit_admin_video_path
      render :action => :edit
    end

  end

  def destroy
    @video = Video.find(params[:id])

    if @video.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
