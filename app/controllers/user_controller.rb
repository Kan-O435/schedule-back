class UserController < ApplicationController
    def show
        @user=User.find(params[:id])
        render json:@user
    end

    def create
        @user=User.new(user_params)
        if @user.save
            render json:@user,status: :created
        else
            render json:{errors:@user.errors.full_message}, status: :unprocessable_entity#ステータスコード422
        end
    end
    #より強固なprivateセクションっていうのがあるらしい,なんかセキュリティ的に必ず書いたほうがいいらしいから後で
end
