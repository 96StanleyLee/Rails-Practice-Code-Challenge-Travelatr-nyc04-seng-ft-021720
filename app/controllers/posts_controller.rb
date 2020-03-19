class PostsController < ApplicationController


    def new
        @post = Post.new

    end 

    def create
        @post = Post.new(strong_params)
        @post.likes = 0 
        if @post.save
            redirect_to @post
        else
            render :new 
        end 
    end 

    def show 
        @post = Post.find(params[:id])
    end 

    def edit 
        redirect_to :update

    end 

    def update 
        @post = Post.find(params[:id])
        likes = @post.likes 
        likes += 1
        @post.update(likes: likes)
        redirect_to @post

    end 





    private 


    def strong_params
        params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id)
    end







end