class Web::Admin::BiographiesController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_biographies_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = Biography.ransack(params[:search])
    @biographies = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @biography = Biography.new
    add_i18n_breadcrumb :new, :new_admin_biography_path
  end

  def create
    @biography = Biography.new(params[:biography])

    if @biography.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_biography_path
      render :action => :new
    end
  end

  def edit
    @biography = Biography.find(params[:id])
    add_breadcrumb @biography, :edit_admin_biography_path
  end

  def update
    @biography = Biography.find(params[:id])

    if @biography.update_attributes(params[:biography])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @biography, :edit_admin_biography_path
      render :action => :edit
    end

  end

  def destroy
    @biography = Biography.find(params[:id])

    if @biography.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
