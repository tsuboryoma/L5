class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(uid: session[:login_uid])
    user.like_tweets << tweet
    redirect_to tweets_path
  end
  #def destroy
  #  tweet = Tweet.find(params[:id])
  #  user = User.find_by(uid: session[:login_uid])
  #  tweet.likes.find_by(user_id: user.id).destroy
  #  redirect_to tweets_path
  #end
  def destroy
    like = Like.find(params[:id]) # 直接「いいね」をIDで見つけます。
    like.destroy if like # もし「いいね」が存在すれば削除します。

    redirect_to tweets_path
  end
end
