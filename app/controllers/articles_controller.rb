class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    article = Article.new(article_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    article.save
    # 4. トップ画面へリダイレクト
    redirect_to '/articles/index'
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
     @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  private
  # ストロングパラメータ
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
