class LikesController < ApplicationController
    def create
        @like = Like.create(user_id: current_user.id , gossip_id: params[:gossip_id])
        redirect_back(fallback_location: gossip_path(params[:gossip_id]))
    end
  
    def destroy
        @like = Like.find(params[:id])
        like_user = @like.user
  
        if current_user == like_user
            @like.destroy
            redirect_back(fallback_location: gossip_path(params[:gossip_id]))
        else
    end
end
end
