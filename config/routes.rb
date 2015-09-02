Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }
  root to: "skills#index"

  resources :skills do
    resources :projects, except: :index
  end

  resources :blogs do
    resources :comments, except: :show
  end

  resources :references, except: :show

  resources :recommendations
end
