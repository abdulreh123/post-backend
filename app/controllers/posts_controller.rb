class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

#  def serializable_hash(opts)
#   super(opts.merge(only: [:id, :title, :content], include: :comment))
# end
  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end
 def getPostsAndComments
     @post= Post.find_by(id: params[:id])
     comment = Comment.where(post_id: params[:id]).count
     data= {data:@post, comment:comment}
      render json: data
# end
  end
   def getPostsPaginated
   @posts = Post.paginate(:page => params[:page], :per_page => 4)
   pageCount = (Post.count/4.0 +0.4).round(half: :up)
   puts Post.count
   if params[:page].to_i <pageCount
    nextPage= true
   else
    nextPage= false
   end
   if params[:page].to_i != 1
    prePage= true
   else
    prePage= false
   end
   data = {data: @posts , pageCount: pageCount,nextPage: nextPage,prePage: prePage }
    render json: data
     # @post= Post.find_by(id: params[:id])
     #  render json: @post, include: :comment
# end
  end
  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, :user, :title)
    end
end
