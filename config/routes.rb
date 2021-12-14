Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
 devise_scope :user do
    get '/users', to: 'devise/registrations#new'#新規登録失敗後の遷移先エラー対策
  end

    root to: 'homes#top'
    get "/about", to: "homes#about"
    get 'search' => 'posts#search'

    resources :users, only:[:show, :edit, :update]

    # 一人用食材管理ルーティング
    resources :foods  do                            # 食材
      resources :comments, only:[:create, :destroy] # 食材コメント
    end

    # 複数人用食材管理ルーティング
    get '/groups/search', to: 'groups#search'
    get '/groups/join', to: 'groups#join'
    resources :groups, only:[:index, :create, :show, :edit, :update, :destroy] do # グループ機能
      resources :share_foods, only:[:new, :index, :create, :show, :edit, :update, :destroy] do                             # 共有食材
        resources :share_comments, only:[:create, :destroy] # 共有食材コメント
      end
    end

    # その他追加機能
    resources :notices, only:[:index]                        # 通知一覧機能
    # 検索機能は他機能が完成後に設定
end
