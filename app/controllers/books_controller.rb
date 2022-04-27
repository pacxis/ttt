class BooksController < ApplicationController
  # DEBUG - REMOVE FOR PRODUCTION!!!
  skip_before_action :verify_authenticity_token
  before_action :set_book, except: [:index, :create] #only: [:show, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def create
    book = Book.create(book_params)
    redirect_to book
  end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    return params.permit(:title, :author_id)
  end
end
