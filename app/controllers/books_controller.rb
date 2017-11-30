class BooksController < ApplicationController
  before_action :correct_book, except: %i(index new create)

  def index
    @books = Book.sort_by_alphabet.paginate(page: params[:page])
  end

  def show; end

  def new
    @book = Book.new
    @publishers = Publisher.all
    @authors = Author.all
    @categories = Category.all
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".book_add_success"
      redirect_to @book
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :category_id, :author_id, :publisher_id,
      :details)
  end

  def correct_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".book_not_found"
    redirect_to root_path
  end
end
