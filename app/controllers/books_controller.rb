# frozen_string_literal: true

# Controller class for Markdown books
# Check the book model
class BooksController < ApplicationController
  before_action :set_book_and_chapter, only: %i[show]

  def show
    @keys = @book.cache_markdowns
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_book_and_chapter
    @book = Book.find_by_path_name(params[:name])
    @chapter = @book.chapter(params[:chapter])
    @chapter_number = params[:chapter].to_i
  end

  def book_params
    params.require(:book).permit(:name)
  end
end
