class GroupsController < ApplicationController
    before_action :authenticate_user!

    def new
        @group = current_user.groups.build
    end

    def create
        @group = current_user.groups.build(group_params)
        @group.user_id = current_user.id
        if @group.save
            redirect_to groups_path, notice: 'グループを作成しました'
        else
            flash.now[:error] = 'グループの作成に失敗しました'
            render :new
        end
    end

    def index
        @groups = Group.all.order(created_at: :desc)
    end

    private
    def group_params
       params.require(:group).permit(:group_name)
    end
end