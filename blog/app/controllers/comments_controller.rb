class CommentsController < ApplicationController
  http_basic_authenticate_with name: "cmb", password: "moo", only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
