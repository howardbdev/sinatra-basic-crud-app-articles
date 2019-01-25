class ArticlesController < ApplicationController


    # NEW
    get "/articles/new" do
      # this action"s job is to render a form to create a new article
      erb :"/articles/new"
    end

    # POST
    post "/articles" do
      # this action's job is to create a new article instance
      @article = Article.create(params[:article])
      redirect "/articles/#{@article.id}"
    end

    # SHOW
    get "/articles/:id" do
      # I know I want to find a particular article, and display it
      # What's the first step?
      @article = Article.find(params[:id]) # <= what do I do with this/???
      erb :'/articles/show'
    end

    # INDEX
    get "/articles" do
      # What do I need to do?
      @articles = Article.all

      erb :"/articles/index"
    end

    # EDIT
    get "/articles/:id/edit" do
      # we want to render a form to edit an article
      @article = Article.find(params[:id])

      erb :"/articles/edit"
    end

    # PATCH
    patch "/articles/:id" do
      @article = Article.find(params[:id])
      @article.update(params[:article])

      redirect "/articles/#{@article.id}"
    end

    # DELETE
    delete "/articles/:id" do
      @article = Article.find(params[:id])
      @article.destroy
      redirect "/articles"
    end
end
