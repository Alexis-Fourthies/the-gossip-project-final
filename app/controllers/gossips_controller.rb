class GossipsController < ApplicationController
    before_action :authenticate_user, only: [:index, :new, :edit]
    before_action :authenticate_current_user, only: [:update, :destroy, :edit]
    def index
      @gossip = Gossip.all
      @gossip = Gossip.new
      
    end
  
    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
  
    def authenticate_current_user
      @gossips = Gossip.find(params[:id])
      if current_user.id == @gossips.user.id
        puts 'yey'
      else
        redirect_to gossips_path
        puts 'oh no'
      end
    end
  
    def new
      @gossip = Gossip.new
    end
  
    def show
      @id = params[:id]
    end
  
    def edit
      @id = params[:id]
      @gossips = Gossip.find(params[:id])
      puts @gossips.id
      puts current_user.id
    end
  
    def update
      @gossips = Gossip.find(params[:id])
      post_params = params.require(:gossip).permit(:title, :content)
      @gossips.update(post_params)
      redirect_to gossips_path
    end 
  
    def create
      @gossip = Gossip.new(post_params)
      @gossip.user_id = current_user.id
      p @gossip
      if @gossip.save
        render "index", :notice => "User saved"
      else
        render "new", :alert => 'Alert message!'
      end
    end
  
    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_path
    end
  
    private
    def post_params
      params.permit(:title, :content)
    end
  
  end
  