class BooksController < ApplicationController
  # DEBUG - REMOVE FOR PRODUCTION!!!
  skip_before_action :verify_authenticity_token

  def index
    @books = Book.all
  end

  def show
    begin
    @book = Book.find(params[:id])
    rescue
      render plain: "Book not found!"
    end
  end

  def create
    render plain: 'books#create'
  end
end
