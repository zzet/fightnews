class Web::Admin::CategoriesController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_categories_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = Category.ransack(params[:search])
    @categories = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @category = Category.new
    add_i18n_breadcrumb :new, :new_admin_category_path
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_category_path
      render :action => :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    add_breadcrumb @category, :edit_admin_category_path
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @category, :edit_admin_category_path
      render :action => :edit
    end

  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
