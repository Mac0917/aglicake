class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resources)
        case resource
        when Member
            member_path(resource)
        when Admin
            admins_members_path
        end
    end

    def after_sign_in_out_for(resources)
        case resource
        when Member
            root_path
        when Admin
            root_path
        end
    end
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :first_name_kana, :last_name_kana, :last_name, :post_number, :address, :phone_number]) #サインインならこのカラムでもいいよっていうこと。必ずしもこのカラムを入力しなければならないことはない。viewページでサインアップに必要なカラムを調整できる
    end

end
