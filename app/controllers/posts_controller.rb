# frozen_string_literal: true

# The "Gonderi" routes the URL into the Posts controller.
# Look for the Post model for more information.
# While editing or creating a new post, the post must be auto-saved by server.
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_login, except: %i[index show]

  unless Rails.env.production?
    before_action do
      Prosopite.scan
    end

    after_action do
      Prosopite.finish
    end
  end

  # GET /gonderi or /gonderi.json
  def index
    @pagy, @posts = pagy Post.order("created_at DESC").with_rich_text_body_and_embeds

    respond_to do |format|
      format.html
      format.json do
        render json: {
          posts: render_to_string(
            PostListComponent.new(posts: @posts, pagy: @pagy),
            formats: [:html],
            layout: false
          ),
          pagy: view_context.pagy_nav(@pagy)
        }
      end
    end
  end

  # GET /gonderi/1 or /gonderi/1.json
  def show; end

  # GET /gonderi/new
  def new
    @post = Post.new
  end

  # GET /gonderi/1/edit
  def edit; end

  # POST /gonderi or /gonderi.json
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

  # PATCH/PUT /gonderi/1 or /gonderi/1.json
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

  # DELETE /gonderi/1 or /gonderi/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to gonderi_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :picture)
  end
end
