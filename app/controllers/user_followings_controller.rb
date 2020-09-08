class UserFollowingsController < ApplicationController
    def show
        @users = User.find(params[:id])
        @user = @users.followings
    end
end