Rails.application.routes.draw 
resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  patch 'post/:id', to: 'posts#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
