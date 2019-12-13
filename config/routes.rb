Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  resources :blogs

  #get 'pages/contact'
  get 'about-me', to: 'pages#about'    #### call localhost:3000/about  to call about page
  #get 'pages/contact'        #### call localhost:3000/contacts
  get 'contact', to: 'pages#contact'

  #get 'pages/home'
  root to: 'pages#home'
end
