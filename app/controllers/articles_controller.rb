class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Artice was successfully created"
            # redirect to articles show
            redirect_to article_path(@article)
        else
            # render 'new' Article template
            render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
end