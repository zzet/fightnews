class Web::Admin::InterviewsController < Web::Admin::ProtectedApplicationController
  add_i18n_breadcrumb :index, :admin_interviews_path

  def index
    params[:search] = { s: 'created_at desc' }.merge(params[:search] || {})
    @search = Interview.ransack(params[:search])
    @interviews = @search.result.page(params[:page]).per(params[:per_page]).decorate
  end

  def new
    @interview = Interview.new
    add_i18n_breadcrumb :new, :new_admin_interview_path
  end

  def create
    @interview = Interview.new(params[:interview])

    if @interview.save
      flash[:success] = flash_translate(:success)
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(:error)
      add_i18n_breadcrumb :new, :new_admin_interview_path
      render :action => :new
    end
  end

  def edit
    @interview = Interview.find(params[:id])
    add_breadcrumb @interview, :edit_admin_interview_path
  end

  def update
    @interview = Interview.find(params[:id])

    if @interview.update_attributes(params[:interview])
      flash[:success] = flash_translate(:success)
      redirect_to action: :index
    else
      flash[:error] = flash_translate(:error)
      add_breadcrumb @interview, :edit_admin_interview_path
      render :action => :edit
    end

  end

  def destroy
    @interview = Interview.find(params[:id])

    if @interview.destroy
      flash[:success] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    redirect_to :action => :index
  end
end
