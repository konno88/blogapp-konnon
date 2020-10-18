class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create
        @post= Post.create(params.require(:post).permit(:user_id, :content, :group_id).merge(:user_id => current_user.id))
        redirect_to "/groups/#{@post.group_id}"
    end

    def destroy
      post = current_user.posts.find(params[:id])
      post.destroy!
      redirect_back(fallback_location: group_path)
    end
end