class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(message: params[:tweet][:message])
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:notice] = '1レコード追加しました'
      redirect_to tweets_path
    else
      render 'tweets/new'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = '1レコード削除しました'
    redirect_to tweets_path
  end

  def show
  end

  def edit
  end

  def update
  end
end
