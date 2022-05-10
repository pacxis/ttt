class BooksController < ApplicationController
  # DEBUG - REMOVE FOR PRODUCTION!!!
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except:[:index, :show]
  before_action :check_auth 
  before_action :set_book, only: [:show, :update, :destroy, :edit]
  before_action :set_authors, only: [:new, :edit, :create, :update]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    begin
      @book = Book.new(book_params)
      @book.save!
      redirect_to book
    rescue
      flash.now[:alert] = @book.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @book.update!(book_params)
      redirect_to @book
    rescue
      flash.now[:alert] = @book.errors.full_messages.join('<br>')
      render 'edit'
    end
  end

  def destroy
    @book.cover.purge
    @book.destroy
    redirect_to books_path
  end

  private

  def check_auth
    authorize Book
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_authors
    @authors = Author.order(:last_name)
  end

  def book_params
    return params.require(:book).permit(:title, :author_id, :cover)
  end
end
