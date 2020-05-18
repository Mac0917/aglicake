class Admins::MembersController < ApplicationController
    def index
        @members = Member.all
    end
    def show
        @member = Member.find(params[:id])
    end
    def edit
        @member = Member.find(params[:id])
    end
    def update
        @member = Member.find(params[:id])
        @member.update(member_params)
        redirect_to admins_member_path(@member.id)
    end
    private 
    def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_number, :address, :phone_number, :status)
    end
end



