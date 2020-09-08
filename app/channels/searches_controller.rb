class SearchesController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = params[:musical_instrument]
        if @user == "ボーカル"
            @users = Profile.where(musical_instrument: 1)
            return @users
        elsif @user == "ボーカル兼ギター"
            @users = Profile.where(musical_instrument: 2)
            return @users
        elsif @user == "ギター"
            @users = Profile.where(musical_instrument: 3)
            return @users
        elsif @user == "ベース"
            @users = Profile.where(musical_instrument: 4)
            return @users
        elsif @user == "キーボード"
            @users = Profile.where(musical_instrument: 5)
            return @users
        elsif @user == "ドラム"
            @users = Profile.where(musical_instrument: 6)
            return @users
        else
            @users = Profile.where(@user)
            return @users.none
        end
    end
end