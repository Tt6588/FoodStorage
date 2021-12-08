Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
    root to: 'homes#top'
    get "/about", to: "homes#about"
    
    resources :users, only:[:show, :edit, :update, :out]
    
    # 一人用食材管理ルーティング
    resources :foods, only:[:new, :index, :create,:show, :edit, :update, :destroy]# 食材
    resources :comments, only:[:create, :destroy]                           # 食材コメント
    
    # 複数人用食材管理ルーティング
    resources :groups, only:[:index, :create, :destroy]                           # グループ機能
    resources :share_foods, only:[:new, :index, :create,:show, :edit, :update, :destroy]# 共有食材
    resources :share_comments, only:[:create, :destroy]                           # 共有食材コメント
    
    # その他追加機能
    resources :notices, only:[:index]                        # 通知一覧機能
    resources :genres, only:[:index, :create, :edit, :update]# ジャンル機能
    # 検索機能は他機能が完成後に設定
end
