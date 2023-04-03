class BookCommentsController < ApplicationController
  def create
    @newbook=Book.new
    @book = Book.find(params[:book_id])
    @user=User.find(@book.user.id)
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.save
    if @book_comment.save
      redirect_to  request.referer
    else
      render 'books/show'
    end

  end
  
  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
