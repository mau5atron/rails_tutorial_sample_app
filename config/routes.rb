Rails.application.routes.draw do

	root 'static_pages#home'

  get '/help' => 'static_pages#help'
  # or get '/help', to: 'static_pages#help'
  # this also creates a new variable called help_path
  # examples: help_path, about_path, x_path

  get '/about' => 'static_pages#about'

  get '/contact' => 'static_pages#contact'

  # root 'application#hello'
end
