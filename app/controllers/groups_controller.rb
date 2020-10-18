class GroupsController < ApplicationController
    before_action :authenticate_user!

    def new
        @group = Group.new
    end

    def create
        group = Group.new(group_params)
        if group.save
            @group1 = UserGroup.create(group_id: group.id, user_id: current_user.id)
            redirect_to action: 'index', notice: 'グループを作成しました'
        else
            flash.now[:error] = 'グループの作成に失敗しました'
            render :new
        end
    end

    def index
        @groups = Group.all.order(created_at: :desc)
        @groups_joining = UserGroup.where(user_id: current_user.id)
        @groups_lists_none = "グループに参加していません"

    end

    def show
        @group = Group.find(params[:id])
        if UserGroup.where(group_id: @group.id).present?
          @posts = @group.posts.includes(:user)
          @post = Post.new
          @user_groups = @group.user_groups.includes(:user)
        else
          redirect_to groups_path
        end
    end

    private
    def group_params
       params.require(:group).permit(:group_name)
    end
end