class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        case resource
        when Member
            if resource.status == "無効会員"
                reset_session
                flash[:notice] = "このメールアドレスは使用できません"
                root_path
            else
            flash[:notice] = "ようこそ、#{resource.last_name}さん!"
            items_path(resource)
            end
        when Admin
            admins_top_path
        end
    end

    def after_sign_out_path_for(resource)
        if resource != :admin
          root_path
        else
          new_admin_session_path
        end
    end

    def after_update_path_for(resource)
        members_path(resource)
    end
    
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :first_name_kana, :last_name_kana, :last_name, :post_number, :address, :phone_number]) #サインインならこのカラムでもいいよっていうこと。必ずしもこのカラムを入力しなければならないことはない。viewページでサインアップに必要なカラムを調整できる
    end
    
end
