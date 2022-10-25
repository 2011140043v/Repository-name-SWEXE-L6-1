class LikesController < ApplicationController
#    def create
#        tweet = Tweet.find(params[:tweet_id])
#        user = User.find_by(uid: session[:uid])
#        logger.debug session[:uid].to_s + '|i'
#        user.like_tweets << tweet
#        redirect_to tweets_path
#    end
  
#    def destroy
#        tweet = Tweet.find(params[:id])
#        user = User.find_by(uid: session[:uid])
#        tweet.likes.find_by(user_id: user.id).destroy
#        redirect_to tweets_path
#    end
    
    def create
        tweet = Tweet.find(params[:tweet_id])
        unless tweet.liked?(current_user)
            tweet.like(current_user)
        end
        redirect_to root_path
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        if tweet.liked?(current_user)
            tweet.unlike(current_user)
        end
        redirect_to root_path
    end

end
