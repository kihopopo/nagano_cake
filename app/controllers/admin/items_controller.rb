class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    item.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
  end
  
  def index
  end

  def show
  end

  def edit
  end
end
