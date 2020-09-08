class FollowingsController < ApplicationController
    before_action :authenticate_user!

    def show
        @users = current_user.followings
    end
end