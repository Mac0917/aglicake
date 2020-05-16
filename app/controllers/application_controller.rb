class ApplicationController < ActionController::Base
    before_action :authenticate_member! #ログインしなかったらどの画面も表示できない、ログインしなかったらログイン画面にレダイレクトする
    before_action :configure_permitted_parameters, if: :devise_controller?
	    def after_sign_in_path_for(resource)  #ログインした後のパス
	       member_path(resource)
        end
        def after_sign_out_path_for(resource)
            new_member_session_path # ログアウト後に遷移するpathを設定
        end
		protected
		def configure_permitted_parameters
		   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :first_name_kana, :last_name_kana, :post_number, :address, :phone_number]) 
		end
end
