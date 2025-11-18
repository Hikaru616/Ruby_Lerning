class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy]

    def index       
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        #コンテント（投稿で打ち込んだ情報がpost_paramsに渡される -> その情報のインスタンスを新たに作成）
        @post = Post.new(post_params)

        if @post.save
            #indexページへリダイレクト
            redirect_to posts_path #posts_pathはroutesでpostsと設定したら自動的に生成される
        else
            #新しい投稿フォームの画面を表示する
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
