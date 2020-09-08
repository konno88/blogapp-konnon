class FollowersController < ApplicationController
    before_action :authenticate_user!

    def show
        @users = current_user.followers
    end
end