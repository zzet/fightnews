class Web::Admin::ArticlesController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_articles_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = Article.ransack(params[:search])
    @articles = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @article = Article.new
    add_i18n_breadcrumb :new, :new_admin_article_path
  end

  def create
    @article = Article.new(params[:article])

    if @article.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_article_path
      render :action => :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    add_breadcrumb @article, :edit_admin_article_path
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @article, :edit_admin_article_path
      render :action => :edit
    end

  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
