class MembersController < ApplicationController
    def show
        @member = Member.find(current_member.id)
    end
    def edit
        @member = Member.find(current_member.id)
    end
    def update   
        @member = Member.find(params[:id])
        @member.update(member_params)
        redirect_to member_path(@member.id)
    end
    def destroy
    end

    def status
    end

    def status_update
        @member = Member.find(current_member.id)
        @member.status = 1.to_i
        @member.save
        redirect_to member_path(current_member.id)
    end


    private 
    def member_params
        params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_number, :address, :phone_number)
    end
end
