class AccountsController < ApplicationController
    def show
        @user = User.find(params[:id])

        @currentUserEntry = Entry.where(user_id: current_user.id)
        @userEntry = Entry.where(user_id: @user.id)
    
        unless @user.id == current_user.id
          @currentUserEntry.each do |currentUserEntry|
            @userEntry.each do |userEntry|
              if currentUserEntry.room_id == userEntry.room_id then
                @InRoom = true
                @roomId = currentUserEntry.room_id
              end
            end
          end
          unless @InRoom
              @room = Room.new
              @entry = Entry.new
          end
        end

        if @user == current_user
            redirect_to profile_path
        end
    end
end