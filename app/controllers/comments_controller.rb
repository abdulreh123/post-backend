class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
# get by posts
 def getPostsComments
     @comment= Comment.where(post_id: params[:postId]).order(created_at: :desc).paginate(:page => 1, :per_page => params[:limit])
     commentCount =Comment.where(post_id: params[:postId]).count
    if params[:limit].to_i < commentCount
    loadMore= true
   else
    loadMore= false
   end

      render json: {data: @comment, loadMore: loadMore }
  end
  # DELETE /comments/1
  def destroy
    @comment.destroy
    render json: @comment
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :user, :post_id)
    end
end
