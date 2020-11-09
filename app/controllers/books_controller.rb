class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "Error"
      render :edit
    end
  end
  
  def create
  	@book = Book.new(book_params)
  	if @book.save
  		flash[:notice] = "Book was successfully added！"
	  	redirect_to book_path(@book.id)
  	else
  		@books = Book.all
  		render :index
  	end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "destroied successfully "
    redirect_to ("/books")
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end