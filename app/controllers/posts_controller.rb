<<<<<<< HEAD
# frozen_string_literal: true

# :nodoc:
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
=======
class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
>>>>>>> 0550685dbe3bb9c3ff3aa298a3def16317b458f2

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
<<<<<<< HEAD
  def show; end
=======
  def show
  end
>>>>>>> 0550685dbe3bb9c3ff3aa298a3def16317b458f2

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
<<<<<<< HEAD
  def edit; end
=======
  def edit
  end
>>>>>>> 0550685dbe3bb9c3ff3aa298a3def16317b458f2

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
<<<<<<< HEAD

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :picture)
  end
=======
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end
>>>>>>> 0550685dbe3bb9c3ff3aa298a3def16317b458f2
end
