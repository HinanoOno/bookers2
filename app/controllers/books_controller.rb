class BooksController < ApplicationController
  def new
  end

  def index
    @user=User.find(current_user.id)
    @book=Book.new
    @books=Book.all
  end
  
  def create
    @user=User.find(current_user.id)
    @books=Book.all
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @user=User.find(current_user.id)
    @newbook=Book.new
    @book=Book.find(params[:id])
    @user=User.find(@book.user.id)
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end

end
