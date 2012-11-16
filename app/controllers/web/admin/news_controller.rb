class Web::Admin::NewsController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_news_index_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = News.ransack(params[:search])
    @news = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @news = News.new
    add_i18n_breadcrumb :new, :new_admin_news_path
  end

  def create
    @news = News.new(params[:news])

    if @news.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_news_path
      render :action => :new
    end
  end

  def show
    @news = News.find(params[:id])
    add_breadcrumb @news, :admin_news_path
  end

  def edit
    @news = News.find(params[:id])
    add_breadcrumb @news, :edit_admin_news_path
  end

  def update
    @news = News.find(params[:id])

    if @news.update_attributes(params[:news])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @news, :edit_admin_news_path
      render :action => :edit
    end

  end

  def destroy
    @news = News.find(params[:id])

    if @news.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
