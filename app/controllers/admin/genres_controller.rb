class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
  end
  
  def create
   genre = Genre.new(genre_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
   genre.save
    # 4. トップ画面へリダイレクト
   redirect_to '/top'
  end

  def edit
  end
end
