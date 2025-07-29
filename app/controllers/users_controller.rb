# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # TODO: 実際のアプリケーションでは認証を追加してください
  # 例: before_action :authenticate_request!, except: [:create]

  def index
    @users = User.all
    # フロントエンドでUID識別が必要なため、uidも含める
    render json: @users.as_json(only: [:id, :name, :email, :uid])
  end

  def show
    @user = User.find(params[:id])
    # :mailではなく:emailに統一
    render json: @user.as_json(only: [:id, :name, :email])
  end

  def create
    # 1. フロントエンドから送られてきたIDトークンを取得
    id_token = user_params[:idToken]
    
    # 2. IDトークンをFirebaseで検証し、デコードされたトークン情報を取得
    #    (この部分はfirebase-auth-sdkのようなgemを使うと簡単に実装できます)
    #    検証に失敗した場合は、エラーを返して処理を中断します。
    # verified_token = FirebaseAuthenticator.verify(id_token)
    # unless verified_token
    #   return render json: { error: '認証に失敗しました。' }, status: :unauthorized
    # end

    # 3. 検証済みの情報を使ってユーザーを作成する
    #    クライアントから送られてきたuidをそのまま信じるのは危険なため、
    #    検証済みトークンに含まれるuidを使うのが安全です。
    user_attributes = {
      name: user_params[:name],
      email: user_params[:email],
      uid: user_params[:uid] # 本来は verified_token['uid'] を使うのが理想
    }

    @user = User.new(user_attributes)

    if @user.save
      render json: @user.as_json(only: [:id, :name, :email]), status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # パスワード関連はFirebaseが管理するため不要
    # :mailは:emailに統一
    params.require(:user).permit(:name, :email, :uid, :idToken)
  end
end