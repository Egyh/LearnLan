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
  end

  def show
  end

  def edit
  end

   private
  # ストロングパラメータ
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
