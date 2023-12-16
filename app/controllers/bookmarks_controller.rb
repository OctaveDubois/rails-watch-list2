class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
