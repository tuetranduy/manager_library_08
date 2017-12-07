class PublishersController < ApplicationController
  before_action :correct_publisher, except: %i(index new create)

  def index
    @publishers = Publisher.order_name.paginate(page: params[:page])
  end

  def new
    @publisher = Publisher.new
  end

  def show
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher
    flash[:danger] = t "form.find_error"
    redirect_to root_path
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      flash[:success] = t "pub.create_succ"
      redirect_to publishers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @publisher.update_attributes publisher_params
      flash[:success] = t "pub.update_succ"
      redirect_to @publisher
    else
      render :edit
    end
  end

  def destroy
    if @publisher.destroy
      flash[:success] = t "pub.delete_succ"
    else
      flash[:danger] = t "pub.error"
    end
    redirect_to publishers_url
  end

  private

  def publisher_params
    params.require(:publisher).permit :name
  end

  def correct_publisher
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher
    flash[:danger] = t "pub.find_error"
    redirect_to publisher_url
  end
end
