class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if request.post?
      @user = User.new(uid: params[:uid], pass: params[:pass])
      if @user.valid?
        @user.pass = BCrypt::Password.create(params[:pass])
        @user.save
        redirect_to top_main_path, notice: '登録が完了しました。ログインしてください位。'
      else
        render "new"
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = 'アカウントを削除しました。'
    redirect_to '/'
  end
end
