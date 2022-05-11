class CommentsController < ApplicationController
    def create
    @id = params[:id]
    @comment = Comment.create(content: params[:content], author_id: current_user.id, gossip_id: params[:gossip_id])
    redirect_to gossip_path(params[:gossip_id])
    
    end
end
