# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    
    # Rubyにおいてのif
    # falslyな値は: false, nil
    # それ以外はtruthyな値になる.

    # NOTE: Customerモデルでenumを利用してしまっているので,対処療法として文字列で条件比較している.
    # TODO: 可能ならCustomerモデルのenumをなくして @customer.is_deleted で条件チェックする.
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == "退会")
      redirect_to new_customer_registration_path
    end
  end
end
