class Web::Admin::TagsController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_tags_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = Tag.ransack(params[:search])
    @tags = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @tag = Tag.new
    add_i18n_breadcrumb :new, :new_admin_tag_path
  end

  def create
    @tag = Tag.new(params[:tag])

    if @tag.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_tag_path
      render :action => :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    add_breadcrumb @tag, :edit_admin_tag_path
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update_attributes(params[:tag])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @tag, :edit_admin_tag_path
      render :action => :edit
    end

  end

  def destroy
    @tag = Tag.find(params[:id])

    if @tag.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
