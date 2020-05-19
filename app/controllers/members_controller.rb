class MembersController < ApplicationController

    before_action :authenticate_member!, except: [:top]

    def show
        @member = Member.find(current_member.id)
        if @member.status == "無効会員"
            reset_session
            flash[:notice] = "このメールアドレスは使用できません"
            redirect_to root_path
        end
    end

    def edit
        @member = Member.find(params[:id])
        if current_member.id != @member.id
            flash[:notice] = "その操作は禁じられています"
            redirect_to edit_member_path(current_member.id)
        end
    end

    def update   
        @member = Member.find(params[:id])
        if @member.update(member_params)
           redirect_to member_path(@member.id)
        else
           render "edit"
        end
    end
    
    def status
    end

    def status_update
        @member = Member.find(current_member.id)
        @member.status = "無効会員"
        @member.save
        reset_session  #ログアウトする
        redirect_to root_path
    end

    private 

    def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_number, :address, :phone_number)
    end

end
        