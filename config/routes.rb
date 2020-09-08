Rails.application.routes.draw do
  get 'business' => 'business#index'
  get 'cooking' => 'cooking#index'
  get 'storyPicture' => 'story_picture#index'
  get 'scienceFiction' => 'science_fiction#index'
  get 'medical' => 'medical#index'
  get 'textBook' => 'text_book#index'
  get 'raiseUpChild' => 'raise_up_child#index'
  get 'lifeSkill' => 'life_skill#index'
  get 'computerScience' => 'computer_science#index'
  get 'page8slide' => 'page8slide#index'
  get 'page7slide' => 'page7slide#index'
  get 'page6slide' => 'page6slide#index'
  get 'page5slide' => 'page5slide#index'
  get 'page4slide' => 'page4slide#index'
  get 'page3slide' => 'page3slide#index'
  get 'page2slide' => 'page2slide#index'
  get 'page1slide' => 'page1slide#index'
  resources :orders
  resources :feedbacks
  get 'search/index'
  resources :link_slides
  resources :slides
  resources :items
  resources :carts
  resources :users
  get 'customer' => 'customer#index'
  get 'admin' => 'admin#index'
  get 'logins/new'
  get 'logins/create'
  get 'logins/destroy'
  resources :accounts
  resources :bookstores
  root :to => 'homes#index'
  resources :books
  resources :languages
  resources :formalities
  resources :companies
  resources :suppliers
  resources :categories
  controller :logins do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end