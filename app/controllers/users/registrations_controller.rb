# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #     super
  # end

  # POST /resource
  # def create
  #   @user = User.new(sign_up_params)
  #   # バリデーションで問題があれば、保存はされず「新規登録画面」に戻る
  #   # if @user.valid?
  #   #   @user.save
  #   #   redirect_to root_path
  #   # else
  #   #   #保存されなければ、newに戻る
  #   #   render 'new'
  # end
  #   unless @user.valid?
  #     flash.now[:alert] = @user.errors.full_messages
  #     render :new and return
  #   end
  #   # session["devise.regist_data"] = {user: @user.attributes}
  #   # session["devise.regist_data"][:user]["password"] = params[:user][:password]
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  #   def configure_sign_up_params
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :personal_name, :family_name_kana, :personal_name_kana, :birthday])
  #   end
  # end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
