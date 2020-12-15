Rails.application.routes.draw do
  get 'sessions/new'
  resources :sessions, only:[:new,:create,:destroy]
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :favorites, only:[:create,:destroy]
  resources :contacts
  resources :users, only:[:new,:create,:show,:edit,:update] do
    get :favorites, on: :member
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
