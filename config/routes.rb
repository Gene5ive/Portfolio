Rails.application.routes.draw do
  resources :projects do
    resources :skills
  end
end
