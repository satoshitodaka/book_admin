class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :set_book, only: %i(show destroy)
  
  def index

  end
  
  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
