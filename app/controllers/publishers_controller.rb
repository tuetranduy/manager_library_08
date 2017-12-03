class PublishersController < ApplicationController
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

  private

  def publisher_params
    params.require(:publisher).permit :name
  end
end
