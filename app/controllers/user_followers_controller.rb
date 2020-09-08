class UserFollowersController < ApplicationController
    def show
        @users = User.find(params[:id])
        @user = @users.followers
    end
end